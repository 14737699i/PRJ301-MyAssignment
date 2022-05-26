/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Random;
import model.MyCircle;

/**
 *
 * @author 14737
 */
@WebServlet(urlPatterns = {"/circle"})
public class NewServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//    throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet NewServlet</title>");  
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet NewServlet at " + request.getContextPath () + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
//    } 
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        String value = request.getParameter("value");
        
        int num = Integer.parseInt(value);
        
        ArrayList<MyCircle> circles = new ArrayList<>();
        
        Random rand = new Random();
        
        final String colorString = "0123456789abcdef";
        
        String randomHexColor = "";
        for (int i = 0; i < num; i++) {
            MyCircle c = new MyCircle();
            
            c.setRadius(rand.nextInt(81) + 20);
            c.setX(rand.nextInt(1000 - c.getRadius() * 2) + c.getRadius());
            c.setY(rand.nextInt(1000 - c.getRadius() * 2) + c.getRadius());
            for (int j = 0; j < 6; j++) {
                randomHexColor = randomHexColor + colorString.charAt(rand.nextInt(16));
            }
            c.setColor(randomHexColor);
            circles.add(c); 
//            var randomColor = Double.toHexString(Math.floor(Math.random()*16777216))
                    //            Integer.toHexString(rand.nextInt(16777216))
            
            randomHexColor = "";
            
        }
        request.setAttribute("circles", circles);
        request.getRequestDispatcher("view/circle").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}