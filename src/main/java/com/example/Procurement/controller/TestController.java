package com.example.Procurement.controller;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.stereotype.Controller;



@Controller
public class TestController {

    
    @GetMapping("/main")
    public String showMainPage(ModelMap model) {
        return "main"; 
    }
    
    @GetMapping("/buyer_dashboard")
    public String showBuyerDashboard() {
        return "buyer_dashboard";
    }
    @GetMapping("/vendor_dashboard")
    public String showVendorDashboard() {
        return "vendor_dashboard";
    }
    @GetMapping("/admin_dashboard")
    public String showAdminDashboard() {
        return "admin_dashboard";
    }
    @GetMapping("/faqs")
    public String showFaqs() {
        return "faqs";
    }
    @GetMapping("/ongoing_tenders")
    public String showOngoingTenders() {
        return "ongoing_tenders";
    }
    
    @GetMapping("/upcoming_tenders")
    public String showUpcomingTenders() {
        return "upcoming_tenders";
    }
    @GetMapping("/vendor_guidelines")
    public String showVendorGuidelines() {
        return "vendor_guidelines";
    }
    

    
    @GetMapping("/register_vendor")
    public String showVendorRegistration() {
        return "register_vendor";
    }
    
    @GetMapping("/statistics")
    public String showStatistics() {
        return "statistics";
    }
    
    
}
