package dev.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Controller1ex extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    public Controller1ex() {
        System.out.println("-> Controller1ex created");
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("GET");
        
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter out =  response.getWriter();
        
        String uri = request.getRequestURI();
        out.println("uri:"+uri+"<br>");
        
        if(uri.equals("/controller1/img1.do1ex")) {
            out.println("<img src='/form/images/spring01.jpg' style='width:80%'>");
        }else if(uri.equals("/controller1/img2.do1ex")){
            out.println("<img src='/form/images/spring02.jpg' style='width:80%'>");
        }else if(uri.equals("/controller1/img3.do1ex")){
            out.println("<img src='/form/images/spring03.jpg' style='width:80%'>");
        }else {
            out.println("URI:"+uri+" 요청하신 주소는 존재하지 않습니다.<br>");
            out.println("주소 확인후 다시 시도해주세요.");
        }
    

    }
    
}