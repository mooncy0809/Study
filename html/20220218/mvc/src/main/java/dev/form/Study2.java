package dev.form;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Study2 extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    public Study2() {
        System.out.println("-> Study2 created.");
    }
 // method='get'
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("GET");
        
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter out =  response.getWriter();
        
        out.println("<h2>GET</h2>");
        out.println("<DIV style='font-size: 26px; coor: #FF0000; text-decoration: bold;'>");
        out.println("  step: " + request.getParameter("step") + "<br>");
        out.println("  next: " + request.getParameter("next") + "<br>");
        out.println("</DIV>");
    }

    // method='post'
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("POST");
        
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter out =  response.getWriter();
        
        out.println("<h2>POST</h2>");
        out.println("<DIV style='font-size: 26px; color: #FF0000; text-decoration: bold;'>");
        out.println("  step: " + request.getParameter("step") + "<br>");
        out.println("  next: " + request.getParameter("next") + "<br>");
        out.println("</DIV>");
    }
}
