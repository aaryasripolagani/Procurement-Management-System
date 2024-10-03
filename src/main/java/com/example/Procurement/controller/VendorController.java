package com.example.Procurement.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.Procurement.service.BuyerQuotationService;
import com.example.Procurement.service.VendorService;

import jakarta.servlet.http.HttpSession;

import com.example.Procurement.model.*;
import com.example.Procurement.repository.BuyerQuotationRepository;
import com.example.Procurement.repository.EmployeeRepository;

@Controller
public class VendorController {

    @Autowired
    private VendorService vendorService;
    
    @Autowired
    private EmployeeRepository employeeRepository;
    
    @Autowired
    private BuyerQuotationService buyerService;

    @PostMapping("/register_vendor")
    public String registerVendor(@RequestParam("name") String name,
                                 @RequestParam("email") String email,
                                 @RequestParam("contact_no") String contactNo,
                                 @RequestParam("company_name") String companyName,
                                 @RequestParam("address") String address,
                                 @RequestParam("company_started_year") int companyStartedYear,
                                 @RequestParam("username") String username,
                                 @RequestParam("password") String password,
                                 @RequestParam("confirm_password") String confirmPassword,
                                 Model model) {

        // Check if passwords match
        if (!password.equals(confirmPassword)) {
            model.addAttribute("error", "Passwords do not match");
            return "register_vendor";  // Redirect back to the registration form with an error
        }

        
        if (vendorService.findByUsername(username) != null) {
            model.addAttribute("error", "Username already exists");
            return "register_vendor";  // Redirect back to the registration form with an error
        }

        // Create and register the vendor
        Vendor vendor = new Vendor();
        vendor.setName(name);
        vendor.setEmail(email);
        vendor.setContactNo(contactNo);
        vendor.setCompanyName(companyName);
        vendor.setAddress(address);
        vendor.setCompanyStartedYear(companyStartedYear);
        vendor.setUsername(username);
        vendor.setPassword(password);

        vendorService.registerVendor(vendor);

        model.addAttribute("success", "Vendor registered successfully!");
        return "vendor_dashboard";  
    }
    
    @GetMapping("/send-quotation-to-vendors")
    public String viewSendQuotationToVendors(Model model) {
    	List<Vendor> vendors = vendorService.getAllVendors();
        
        model.addAttribute("vendors", vendors);
        
        return "send-quotation-to-vendors";  
    }

    @PostMapping("/submit-invoice")
    public String generateInvoice(@RequestParam("quotationId") int quotationId,HttpSession session) {
    	Integer vendorId=(Integer) session.getAttribute("vendorid");
    	
    	int empid=buyerService.getempid(quotationId,vendorId.intValue());
    	
        String empEmail = employeeRepository.getempemail(empid);
        if (empEmail != null && !empEmail.isEmpty()) {
        	BuyerQuotation mpr = buyerService.findRow(quotationId,empid,vendorId);

                // Construct the email subject and text
                String subject = "Invoice Generated for Quotation ID: " + mpr.getId().getQuotationId();
                String text = String.format("An invoice has been generated for the following details:\n\n" +
                    "Quotation ID: %d\n" +
                    "Item: %s\n" +
                    "Quantity: %d\n" +
                    "Unit Price: %.2f\n" +
                    "IGST: %.2f\n" +
                    "CGST: %.2f\n" +
                    "SGST: %.2f\n" +
                    "Close Date: %s\n" +
                    "Estimated Bid Price: %.2f\n\n" +
                    "Thank you for your business!",
                    mpr.getId().getQuotationId(),
                    mpr.getItemName(),
                    mpr.getQuantity(),
                    mpr.getUnitPrice(),
                    mpr.getIgst(),
                    mpr.getCgst(),
                    mpr.getIgst(),
                    mpr.getQuotationEndDate(),
                    mpr.getTotalPrice()
                );

                
            System.out.println(" emp email is " +empEmail +"\n");
            // Sending the email
         vendorService.sendEmail(empEmail, subject, text);
        } else {
            // Handle case where email is not found
            // You can log an error or throw an exception
            System.out.println("Employee email not found for EId: " + empid);
        }

        // Redirect to a success page or back to the quotations page
        return "redirect:/vendor_dashboard"; // or any appropriate redirect
    }
}
