package com.megacab.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.megacab.model.RegisterModel;
import com.megacab.service.RegisterService;

@WebServlet("/Register")
public class RegistraionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private RegisterService registerService = new RegisterService();
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        System.out.println("Inside the register controller");

        // Get values from request
        String name = request.getParameter("Name");
        String nic = request.getParameter("NIC");
        String address = request.getParameter("Address");
        String password = request.getParameter("pass");
        boolean agree = request.getParameter("agree") != null;
        
        // Validate inputs
        if (name == null || nic == null || address == null || password == null) {
            request.setAttribute("Response", "Error: Please fill in all fields.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }
        
        // Create model object
        RegisterModel registerModel = new RegisterModel(name, nic, address, password, agree);
        
        // Call service method
        String responseMessage = registerService.registerUser(registerModel);
        
        // Redirect to login page if successful
        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
        if (dispatcher != null && responseMessage.equals("Registration Successful")) {
            request.setAttribute("Response", "Successful");
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("Response", responseMessage);
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}
