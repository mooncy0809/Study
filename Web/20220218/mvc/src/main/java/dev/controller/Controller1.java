package dev.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Controller1 extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    public Controller1() {
        System.out.println("-> Controller1 created");
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("GET");
        
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter out =  response.getWriter();
        
        out.println("<h1>Hello MVC</h1>");
        out.println("<h2>URL: " + request.getRequestURL()+"</h2>");
        out.println("<h2>URI: " + request.getRequestURI()+"</h2>");

    }
    
}