package dev.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Controller2 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Controller2() {
        System.out.println("-> Controller2 created.");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uri = request.getRequestURI();
        System.out.println("URI: "+ uri );
        
        if (uri.equals("/controller2/spring.do2")) {
            request.setAttribute("title", "숲속의 펜션");
            request.setAttribute("fname", "/season/images/spring01.jpg");
        } else if (uri.equals("/controller2/summer.do2")) {
            request.setAttribute("title", "만항재 여름");
            request.setAttribute("fname", "/season/images/summer01.jpg");
        } else if (uri.equals("/controller2/fall.do2")) {
            request.setAttribute("title", "문광 저수지");
            request.setAttribute("fname", "/season/images/fall01.jpg");
        } else if (uri.equals("/controller2/winter.do2")) {
            request.setAttribute("title", "XMAS");
            request.setAttribute("fname", "/season/images/winter01.jpg");
        }
 
        String view = "/season/view.jsp"; // "/webapp" 폴더 기준
        RequestDispatcher dispatcher = request.getRequestDispatcher(view);
        dispatcher.forward(request, response);   
        
        
    }

}
