import java.io.*;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintStream;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.http.*;

public class Nana extends HttpServlet {

  public void service(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException {
    System.out.println("hello servlet");

    OutputStream os = response.getOutputStream();
    PrintStream outPaintStream = new PrintStream(os, true);
    outPaintStream.println("Hello Servlet!! outputstream");

    PrintWriter out = response.getWriter();
    out.println("Hello Servlet!!?? printwriter");
  }
}
