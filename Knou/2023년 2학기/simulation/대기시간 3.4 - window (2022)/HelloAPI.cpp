#include <windows.h>
#include <atlstr.h> 

#define ID_SIMULATION_BTN	2000
#define ID_OK_BTN	3000
#define ID_SEED	    4000
#define ID_ARRIVAL	5000
#define ID_MEAN	    6000
#define ID_LIMIT	7000


float mean ;
//
HINSTANCE g_hInst;
LPCTSTR lpszClass = L"SINGLE QUEUE";
LPCTSTR ChildClassName = L"SIMULATION OUTPUT";

HWND cWindow1;

int iseed, iprarr, pomean, ilimit;



LRESULT CALLBACK WndProc(HWND,UINT,WPARAM,LPARAM);
LRESULT CALLBACK ChildWndProc(HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam);

void random(long* np, float* up);

int APIENTRY WinMain(HINSTANCE hInstance,
					 HINSTANCE hPrevInstance,
					 LPSTR lpszCmdParam,
					 int nCmdShow)
{
	HWND hWnd;
	MSG Message;
	WNDCLASS WndClass;
	g_hInst=hInstance;
	
	WndClass.cbClsExtra=0;
	WndClass.cbWndExtra=0;
	WndClass.hbrBackground = (HBRUSH)CreateSolidBrush(RGB(243, 243, 243));
	WndClass.hCursor=LoadCursor(NULL,IDC_ARROW);    
	WndClass.hIcon=LoadIcon(NULL,IDI_APPLICATION);
	WndClass.hInstance=hInstance;
	WndClass.lpfnWndProc=(WNDPROC)WndProc;
	WndClass.lpszClassName=lpszClass;
	WndClass.lpszMenuName=NULL;
	WndClass.style=CS_HREDRAW | CS_VREDRAW;
	RegisterClass(&WndClass);     //���������� Ŭ���� ���

	WndClass.lpfnWndProc =ChildWndProc;      //���ϵ� ������ ���ν���
	WndClass.hbrBackground = (HBRUSH)CreateSolidBrush(RGB(233, 191, 219));
	WndClass.lpszClassName =ChildClassName; //���ϵ� ������ Ŭ�����̸�
	RegisterClass(&WndClass); 

	

	hWnd=CreateWindow(lpszClass,			//������Ŭ���� �̸�
					L"����â�� ������ �ùķ��̼�",			    //������Ÿ��Ʋ
					WS_OVERLAPPEDWINDOW | WS_VISIBLE ,   //�����콺Ÿ��
					50, 20,							//�����찡 ���϶� X Y��ǥ
					1200, 1000,							//�������� ���� ����				
					(HWND)NULL,							//�θ������� �ڵ�
					(HMENU)NULL,						//�����찡 ������ �޴��ڵ�
					hInstance,							//�ν��Ͻ��ڵ�
					NULL);								//������ ������

 	   ShowWindow(hWnd,nCmdShow);
	
	while(GetMessage(&Message,0,0,0)) {
		TranslateMessage(&Message);
		DispatchMessage(&Message);
	}
	return Message.wParam;
}


//  RANDOM NUMBER GENERATOR  //
void random(long* np, float* up)
{
	*np = *np * 843314861 + 453816693;
	if (*np < 0)
	{
		*np = *np + 2147483647;
		*np = *np + 1;
	}
	*up = *np * 0.4656612e-9;
}

//  POISSON RANDOM VARIABLE GENERATOR  //
void poissn(long* np, int* pp)
{
	float prod, b, u;

	*pp = 0;
	b = exp(-mean);
	prod = 1;

	random(np, &u);
	prod = prod * u;
	while (prod >= b)
	{
		random(np, &u);
		prod = prod * u;
		++(*pp);
	}
}

LRESULT CALLBACK WndProc(HWND hWnd, UINT iMessage,
						 WPARAM wParam, LPARAM lParam)
{
	LPCTSTR text9 = L" �����ϱ�  ����  ��°�� ������  �����  C:work ������  ������ �մϴ�.";
	LPCTSTR text = L" �Ʒ� �����Ϳ�  ������  ����������  �Է��� ��  [�ùķ��̼�] ��ư��  Ŭ���մϴ�. ";

	LPCTSTR text1 = L"�ʱⰪ(SEED)";
	LPCTSTR text2 = L"��������";
	LPCTSTR text3 = L"����ð����";
	LPCTSTR text4 = L"����ð�";
	
	switch(iMessage) {
		case WM_PAINT:
			{
				PAINTSTRUCT ps;
				HDC hdc = BeginPaint(hWnd, &ps);
				SetBkColor(hdc, RGB(243, 243, 243));
				TextOut(hdc, 40, 20, text9, lstrlen(text9));
				TextOut(hdc, 40, 40, text, lstrlen(text));
				TextOut(hdc, 60, 80, text1, lstrlen(text1));
				TextOut(hdc, 180, 80, text2, lstrlen(text2));
				TextOut(hdc, 300, 80, text3, lstrlen(text3));
				TextOut(hdc, 420, 80, text4, lstrlen(text4));
				
				EndPaint(hWnd,&ps);
				return 0;
			}
		case WM_CREATE:
		{
			HWND hChildWnd = CreateWindow( 
							ChildClassName,     		// ���ϵ� ������ Ŭ���� �̸� 
							L" �ùķ��̼� ��°��",            	// ������ Ÿ��Ʋ 
				            WS_OVERLAPPEDWINDOW | WS_CHILD|ES_AUTOHSCROLL,   // ������  ��Ÿ�� 
							60,       		// ������ ���� �� x ��ǥ 
							150,       		// ������ ���� �� y ��ǥ 
							800,       		// ������ ��
							800,       		// ������ ����
							hWnd,         		// �θ� ������
							(HMENU) 1000,        	// ���ϵ� ������ID 
							g_hInst,           		// �ν��Ͻ� �ڵ� 
							(LPVOID) NULL);      	// ������ ������			

			ShowWindow(hChildWnd, SW_SHOW); 
			cWindow1 = hChildWnd;
			
			hChildWnd = CreateWindow(
				L"edit",        		// ������ Ŭ���� �̸�  
				L"",
				WS_CHILD | WS_VISIBLE | WS_BORDER |
				ES_LEFT | ES_AUTOHSCROLL, 	// ������ ��Ÿ��
				60,  // ������ ���� �� x ��ǥ 
				100, // ������ ���� �� y ��ǥ 
				80, // ������ ��
				20,  // ������ ����
				hWnd, // �θ� ������
				(HMENU)ID_SEED, // �ʱⰪ
				g_hInst,					// �ν��Ͻ� �ڵ� 
				0);							// ������ ������

			hChildWnd = CreateWindow(
				L"edit",        		// ������ Ŭ���� �̸�  
				L"",
				WS_CHILD | WS_VISIBLE | WS_BORDER |
				ES_LEFT | ES_AUTOHSCROLL, 	// ������ ��Ÿ��
				180,  // ������ ���� �� x ��ǥ 
				100, // ������ ���� �� y ��ǥ 
				80, // ������ ��
				20,  // ������ ����
				hWnd, // �θ� ������
				(HMENU)ID_ARRIVAL, // �ð� �� �������� ��
				g_hInst,					// �ν��Ͻ� �ڵ� 
				0);							// ������ ������

			hChildWnd = CreateWindow(
				L"edit",        		// ������ Ŭ���� �̸�  
				L"",
				WS_CHILD | WS_VISIBLE | WS_BORDER |
				ES_LEFT | ES_AUTOHSCROLL, 	// ������ ��Ÿ��
				300,  // ������ ���� �� x ��ǥ 
				100, // ������ ���� �� y ��ǥ 
				80, // ������ ��
				20,  // ������ ����
				hWnd, // �θ� ������
				(HMENU)ID_MEAN, // ����ð� ��� 
				g_hInst,					// �ν��Ͻ� �ڵ� 
				0);							// ������ ������

			hChildWnd = CreateWindow(
				L"edit",        		// ������ Ŭ���� �̸�  
				L"",
				WS_CHILD | WS_VISIBLE | WS_BORDER |
				ES_LEFT | ES_AUTOHSCROLL, 	// ������ ��Ÿ��
				420,  // ������ ���� �� x ��ǥ 
				100, // ������ ���� �� y ��ǥ 
				80, // ������ ��
				20,  // ������ ����
				hWnd, // �θ� ������
				(HMENU)ID_LIMIT, // ����ð�
				g_hInst,					// �ν��Ͻ� �ڵ� 
				0);							// ������ ������

			

			hChildWnd = CreateWindow(
				L"button",        		// ������ Ŭ���� �̸� 
				L"�ùķ��̼�",			// ������ Ÿ��Ʋ 
				WS_CHILD | WS_VISIBLE, 	// ������ ��Ÿ�� 
				600,       		// ������ ���� �� x ��ǥ 
				80,       		// ������ ���� �� y ��ǥ 
				150,       		// ������ ��
				30,       		// ������ ����
				hWnd,         		// �θ� ������
				(HMENU)ID_SIMULATION_BTN,   	// �ùķ��̼� �����ư
				g_hInst,           		// �ν��Ͻ� �ڵ� 
				(LPVOID)NULL);      	// ������ ������
			
			
			if (!hChildWnd) 	return -1; 
			return 0;
		}
		case WM_COMMAND:
		{
			
			if(LOWORD(wParam) == ID_SIMULATION_BTN)
			{			
				iseed = GetDlgItemInt(hWnd, ID_SEED, NULL, TRUE);
				iprarr = GetDlgItemInt(hWnd, ID_ARRIVAL, NULL, TRUE);
				pomean = GetDlgItemInt(hWnd, ID_MEAN, NULL, TRUE);
				ilimit = GetDlgItemInt(hWnd, ID_LIMIT, NULL, TRUE);
			
			
				if (ilimit == 0) 
				{
					MessageBox(hWnd, L"���� �Էµ��� �ʾҽ��ϴ�.", L"����", MB_OK);
				}
				else 
				{
					MessageBox(hWnd, L"C:work ������ ���������? ", L" �Է¿Ϸ�", MB_OK);

					//		
					ShowWindow(cWindow1, SW_HIDE);
					ShowWindow(cWindow1, SW_RESTORE); // ���ϵ� ������ ��������
					SetFocus(hWnd);

				} // else
			} // if - else
		
			
			
			return 0;
		}
		case WM_DESTROY:
			PostQuitMessage(0);
			return 0;
		}
	return(DefWindowProc(hWnd,iMessage,wParam,lParam));
}
LRESULT CALLBACK ChildWndProc(HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam)
{
	LPCTSTR text = L"TIME    ARRIVAL    QUEUE    TPUMP   ";
	// LPCTSTR str = L" ";
	switch(message)
	{
		case WM_PAINT:
		{  
		long seed, nseed;
		float prarr , tpump=0 , time=0 , tlimit , u=0  , aveque=0 , avgwt=0;
		int  p, queue = 0, totque = 0, arrive, tstep = 1, totarr = 0;
		FILE* output;

		seed = iseed;
		nseed = iseed;
		mean = float(pomean);
		prarr = float(iprarr) / 60.0;
		tlimit = ilimit;

		output = fopen("c:\\work\\ex3-3.out", "wt");

		fprintf(output, "      SIMULATION FOR A QUEUEING SYSTEM \n\n");
		fprintf(output, "THE TIME STEP            =  %d \n", tstep);
		fprintf(output, "THE TIME LIMIT           =  %3.0f \n", tlimit);
		fprintf(output, "THE ARRIVAL PROBABILITY  =  %4.2f \n", prarr);
		fprintf(output, "THE POISSON MEAN         =  %1.0f \n", mean);
		fprintf(output, "THE SEED                 =  %ld \n\n", seed);
		fprintf(output, "   TIME    ARRIVAL    QUEUE     TPUMP\n");
			
			PAINTSTRUCT ps;
			HDC hdc = BeginPaint(hWnd,&ps);
			SetBkColor(hdc, RGB(233, 191, 219));
	
			CString p_txt; //���ڿ� �ٷ�� ���� Cstring Ŭ������ �ӽ� ����
			TextOut(hdc, 15, 15, text, lstrlen(text));
			while (time < tlimit)
			{
				time = time + tstep;
				arrive = 0;
				random(&seed, &u);
				if (u < (prarr * tstep))
				{
					arrive = 1;
					queue = queue + arrive;
					totarr = totarr + 1.0;
				}
				if (tpump > 0.0)
				{
					tpump = tpump - tstep;
					if (tpump < 0.0) tpump = 0.0;
				}
				if ((tpump == 0) && (queue != 0))
				{
					queue = queue - 1;
					poissn(&nseed, &p);
					tpump = p;
				}
				totque = totque + queue;

				p_txt.Format(_T(" %3.0f           %d             %d            %2.0f "),
					         time, arrive, queue, tpump);
							
				TextOut(hdc, 15, 25+time*20, p_txt, lstrlen(p_txt));
				fprintf(output, "   %3.0f        %d         %d        %2.0f \n", time, arrive, queue, tpump);

			}// end while

			if (iseed > 0)
			{
				aveque = totque / (tlimit / tstep);
				avgwt = totque / (float)totarr;
				p_txt.Format(_T("  THE SIMULATED TIME =   %5.1f "), tlimit);
				TextOut(hdc, 400, 45, p_txt, lstrlen(p_txt));

				p_txt.Format(_T("  THE SEED =      %d "), iseed);
				TextOut(hdc, 400, 45 + 20, p_txt, lstrlen(p_txt));

				p_txt.Format(_T("  THE ARRIVAL PROBABILITY =   %5.2f "), prarr);
				TextOut(hdc, 400, 45 + 40, p_txt, lstrlen(p_txt));
				
				p_txt.Format(_T("  THE POISSON MEAN     =   %d "), pomean);
				TextOut(hdc, 400, 45 + 60, p_txt, lstrlen(p_txt));

				p_txt.Format(_T("  THE TOTAL ARRIVALS =   %d "), totarr);
				TextOut(hdc, 400, 45 + 80, p_txt, lstrlen(p_txt));

				p_txt.Format(_T("  THE TOTAL QUEUE =  %d "), totque);
				TextOut(hdc, 400, 45 + 100, p_txt, lstrlen(p_txt));

				p_txt.Format(_T("  MEAN QUEUE LENGTH  =   %4.2f "), aveque);
				TextOut(hdc, 400, 45 + 120, p_txt, lstrlen(p_txt));

				p_txt.Format(_T("  MEAN WAITING TIME  =   %9.7f "), avgwt);

				TextOut(hdc, 400, 45 + 140, p_txt, lstrlen(p_txt));

				p_txt.Format(_T(" C:work ������  ex3-3.out ������ ���� �ٶ��ϴ�! "));

				TextOut(hdc, 400, 45 + 180, p_txt, lstrlen(p_txt));

				EndPaint(hWnd, &ps);
			} // end if
			fprintf(output, "\n\n  THE SIMULATED TIME =   %5.1f \n", tlimit);
			fprintf(output, "  THE TOTAL ARRIVALS =   %d \n", totarr);
	//		fprintf(output, "  THE TOTAL QUEUE =  %d \n", totque);			
			fprintf(output, "  MEAN QUEUE LENGTH  =   %4.2f \n", aveque);
			fprintf(output, "  MEAN WAITING TIME  =   %9.7f \n", avgwt);
			fclose(output);
			return 0;
		} // end case

	} // end switch

	return DefWindowProc(hWnd, message, wParam, lParam);
}
