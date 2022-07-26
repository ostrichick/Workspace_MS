import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Nana extends HttpServlet {

  public void service(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException {
    System.out.println("hello servlet");
  }
}
