package com.example.Procurement.controller;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.Procurement.model.Admin;
import com.example.Procurement.model.Employee;
import com.example.Procurement.model.Vendor;
import com.example.Procurement.service.LoginService;

import jakarta.servlet.http.HttpSessionEvent;

@Controller
public class LoginController {

    @Autowired
    private LoginService loginService;

    // Get Mapping for Employee Login Page
    @GetMapping("/buyer-login")
    public String showEmployeeLoginPage() {
        return "buyer-login"; // buyer-login.jsp page
    }

    // Post Mapping for Employee Login
    @PostMapping("/buyer-login")
    public String processEmployeeLogin(@RequestParam("username") String username,
                                       @RequestParam("password") String password, 
                                       Model model, HttpSession session) {
        Employee employee = loginService.verifyEmployeeLogin(username, password);
        if (employee != null) {
            // Store employee ID in session
            session.setAttribute("empid", employee.getEmpid());
            // Login successful, redirect to employee dashboard
            return "redirect:/buyer_dashboard"; // Change to the actual employee dashboard page
        } else {
            // Login failed, show error
            model.addAttribute("error", "Invalid username or password");
            return "buyer-login";
        }
    }

    // Get Mapping for Admin Login Page
    @GetMapping("/admin-login")
    public String showAdminLoginPage() {
        return "admin-login"; // admin-login.jsp page
    }

    // Post Mapping for Admin Login
    @PostMapping("/admin-login")
    public String processAdminLogin(@RequestParam("username") String username,
                                    @RequestParam("password") String password, 
                                    Model model, HttpSession session) {
        Admin admin = loginService.verifyAdminLogin(username, password);
        if (admin != null) {
            // Store admin ID in session
            session.setAttribute("adminid", admin.getAdminid());
            // Login successful, redirect to admin dashboard
            return "redirect:/admin_dashboard"; // Change to the actual admin dashboard page
        } else {
            // Login failed, show error
            model.addAttribute("error", "Invalid username or password");
            return "admin-login";
        }
    }

    // Get Mapping for Vendor Login Page
    @GetMapping("/vendor-login")
    public String showVendorLoginPage() {
        return "vendor-login"; // vendor-login.jsp page
    }

    // Post Mapping for Vendor Login
    @PostMapping("/vendor-login")
    public String processVendorLogin(@RequestParam("username") String username,
                                     @RequestParam("password") String password, 
                                     Model model, HttpSession session) {
        Vendor vendor = loginService.verifyVendorLogin(username, password);
        if (vendor != null) {
            // Store vendor ID in session
            session.setAttribute("vendorid", vendor.getVendorId());
           
            return "redirect:/vendor_dashboard"; // Change to the actual vendor dashboard page
        } else {
            // Login failed, show error
            model.addAttribute("error", "Invalid username or password");
            return "vendor-login";
        }
    }
}
