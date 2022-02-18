package dev.controller;
 
import java.io.IOException;
import java.io.PrintWriter;
 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
public class Controller2ex extends HttpServlet {
  private static final long serialVersionUID = 1L;
       
  public Controller2ex() {
    System.out.println("-> Controller2ex created.");
  }
  
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String uri = request.getRequestURI();
      System.out.println("URI: "+ uri );
      
      if (uri.equals("/controller2/img1.do2ex")) {
          request.setAttribute("title", "토이스토리");
          request.setAttribute("fname", "/movie/images/animation01.jpg");
      } else if (uri.equals("/controller2/img2.do2ex")) {
          request.setAttribute("title", "미스터 빈의 홀리데이");
          request.setAttribute("fname", "/movie/images/comedy01.jpg");
      } else if (uri.equals("/controller2/img3.do2ex")) {
          request.setAttribute("title", "어바웃 타임");
          request.setAttribute("fname", "/movie/images/romance01.jpg");
      } else if (uri.equals("/controller2/img4.do2ex")) {
          request.setAttribute("title", "그래비티");
          request.setAttribute("fname", "/movie/images/sf01.jpg");
      }

      String view = "/movie/viewex.jsp"; // "/webapp" 폴더 기준
      RequestDispatcher dispatcher = request.getRequestDispatcher(view);
      dispatcher.forward(request, response);      
  }
}
