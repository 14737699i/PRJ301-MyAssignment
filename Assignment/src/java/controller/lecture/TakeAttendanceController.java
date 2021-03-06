/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.lecture;

import dal.AttendanceReportDBContext;
import dal.GroupDBContext;
import dal.GroupStudentDBContext;
import dal.LectureDBContext;
import dal.SessionDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import model.AttendanceReport;
import model.GroupStudent;
import model.Lecture;
import model.Session;
import model.Student;

/**
 *
 * @author win
 */
public class TakeAttendanceController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet TakeAttendanceController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TakeAttendanceController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

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
        String rawDate = request.getParameter("currentDate");
        Date currentDate;
        if(rawDate == null){
            currentDate = new Date(System.currentTimeMillis());
        }  else {
            currentDate = Date.valueOf(rawDate);
        }
        
        SessionDBContext sDB = new SessionDBContext();
        String lectureId = request.getParameter("lectureId");

//        Collections.sort(sessions, new Comparator<Session>() {
//            @Override
//            public int compare(Session o1, Session o2) {
//                return o1.getTimeSlotId() - o2.getTimeSlotId();
//            }
//        });
        LectureDBContext lDB = new LectureDBContext();
        ArrayList<Lecture> lectures = lDB.list();
        request.setAttribute("lectures", lectures);
        request.setAttribute("currentDate", currentDate.toString());
        request.setAttribute("lectureId", lectureId);
        request.getRequestDispatcher("../view/lecture/takeattendance.jsp").forward(request, response);

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
        String lectureId = request.getParameter("lectureId");
        String currentDate = request.getParameter("currentDate");
        String sid = request.getParameter("sid");
        SessionDBContext sDB = new SessionDBContext();
        LectureDBContext lDB = new LectureDBContext();
        ArrayList<Lecture> lectures = lDB.list();

        request.setAttribute("lectures", lectures);
        if (sid != null) {
            if (sid.length() > 0) {
                Session s = sDB.get(Integer.parseInt(request.getParameter("sid")));
                if (s.isStatus()) {
                    AttendanceReportDBContext arDB = new AttendanceReportDBContext();
                    ArrayList<AttendanceReport> ars = arDB.getBySession(s.getId());
                    request.setAttribute("ars", ars);
                } else {
                    GroupStudentDBContext gsDB = new GroupStudentDBContext();
                    ArrayList<Student> students = gsDB.getStudentsByGroup(s.getGroup().getId());
                    request.setAttribute("students", students);
                }
                request.setAttribute("currentDate", currentDate);
                request.setAttribute("lectureId", lectureId);
                request.setAttribute("session", s);
                request.getRequestDispatcher("../view/lecture/attendancereport.jsp").forward(request, response);
            }            
        } 
            ArrayList<Session> sessions = sDB.getByDate(Date.valueOf(currentDate), lectureId);
            request.setAttribute("sessions", sessions);
            request.setAttribute("currentDate", currentDate);
            request.setAttribute("lectureId", lectureId);
            request.getRequestDispatcher("../view/lecture/takeattendance.jsp").forward(request, response);
        

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
