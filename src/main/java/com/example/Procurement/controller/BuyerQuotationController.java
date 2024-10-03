package com.example.Procurement.controller;
import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.Procurement.model.BuyerQuotation;
import com.example.Procurement.model.QuotationHelper;
import com.example.Procurement.service.BuyerQuotationService;

import jakarta.servlet.http.HttpSession;

@Controller
public class BuyerQuotationController {

    @Autowired
    private BuyerQuotationService quotationService;

    @GetMapping("/generate_quotation")
    public String showQuotationForm(Model model) {
        model.addAttribute("buyerQuotation", new BuyerQuotation());
        return "generate_quotation"; 
        }

    @PostMapping("/generate_quotation")
    public String saveQuotation(@ModelAttribute("buyerQuotation") BuyerQuotation buyerQuotation, Model model) {
        buyerQuotation.calculateTotalPrice();
        quotationService.saveQuotation(buyerQuotation);
        model.addAttribute("successMessage", "Quotation saved successfully");
        return "redirect:/buyer_dashboard"
        		+ ""; 
    }
    
    @PostMapping("/send-quotation-to-vendors")
    public String saveVendorsQuotation(
            @ModelAttribute("buyerQuotation") BuyerQuotation buyerQuotation,
            @RequestParam("selectedVendorIds") String selectedVendorIds,
            Model model) {
        
        // Split the vendor IDs by comma
        String[] vendorIds = selectedVendorIds.split(",");

        // Process each vendor ID
        for (String vendorIdStr : vendorIds) {
            int vendorId = Integer.parseInt(vendorIdStr.trim());

            // Create a new BuyerQuotation for each vendor
            BuyerQuotation quotationForVendor = new BuyerQuotation();
            quotationForVendor.setId(new QuotationHelper(buyerQuotation.getId().getQuotationId(), vendorId));
            
            // Set other properties from buyerQuotation
            quotationForVendor.setBuyerId(buyerQuotation.getBuyerId());
            quotationForVendor.setAdminId(buyerQuotation.getAdminId());
            quotationForVendor.setCurrency(buyerQuotation.getCurrency());
            quotationForVendor.setQuotationStartDate(buyerQuotation.getQuotationStartDate());
            quotationForVendor.setQuotationEndDate(buyerQuotation.getQuotationEndDate());
            quotationForVendor.setIgst(buyerQuotation.getIgst());
            quotationForVendor.setCgst(buyerQuotation.getCgst());
            quotationForVendor.setSgst(buyerQuotation.getSgst());
            quotationForVendor.setItemName(buyerQuotation.getItemName());
            quotationForVendor.setQuantity(buyerQuotation.getQuantity());
            quotationForVendor.setUnitPrice(buyerQuotation.getUnitPrice());
            quotationForVendor.setStatus(buyerQuotation.getStatus());

            // Calculate total price for this vendor's quotation
            quotationForVendor.calculateTotalPrice();
            
            // Save the quotation for the vendor
            quotationService.saveQuotation(quotationForVendor);
        }

        model.addAttribute("successMessage", "Quotations saved successfully for selected vendors");
        return "redirect:/admin_dashboard"; 
    }
    
    @GetMapping("/view-quotations")
    public String viewQuotationsWithVendorIdZero(HttpSession session, Model model) {
        // Retrieve the adminId from the session
        Integer adminId = (Integer) session.getAttribute("adminid");
        
        // Pass the adminId to the service method
        List<BuyerQuotation> quotations = quotationService.getAdminQuotations(adminId);
        
        // Add the quotations to the model
        model.addAttribute("quotations", quotations);
        
        return "view-quotations"; 
    }
    
    @GetMapping("/approved-quotations")
    public String viewApprovedQuotations(HttpSession session, Model model) {
    	Integer adminId = (Integer) session.getAttribute("adminid");
        List<BuyerQuotation> quotations = quotationService.getAdminApprovedQuotations(adminId);
        model.addAttribute("quotations", quotations);
        return "approved-quotations"; 
    }
    
    @GetMapping("/rejected-quotations")
    public String viewRejectedQuotations(HttpSession session,Model model) {
    	Integer adminId = (Integer) session.getAttribute("adminid");
        List<BuyerQuotation> quotations = quotationService.getAdminRejectedQuotations(adminId);
        model.addAttribute("quotations", quotations);
        return "rejected-quotations";
    }

    @PostMapping("/view-quotations")
    public String saveUpdatedQuotation(@ModelAttribute("buyerQuotation") BuyerQuotation buyerQuotation,
                                        @RequestParam("status") String status, Model model) {
        // Set the status from the request
        buyerQuotation.setStatus(status);

        // Calculate total price and save the quotation
        buyerQuotation.calculateTotalPrice();
        quotationService.saveQuotation(buyerQuotation);
        
        model.addAttribute("successMessage", "Quotation saved successfully");
        return "redirect:/view-quotations"; 
    }
    
    @GetMapping("/edit-quotation")
    public String editQuotation(@RequestParam("quotationId") int quotationId, Model model) {
        BuyerQuotation quotation = quotationService.findById(quotationId,0);
        model.addAttribute("quotation", quotation);
        return "edit-quotation"; // The name of the JSP file for editing
    }

    // Method to handle the form submission
    @PostMapping("/edit-quotation")
    public String updateQuotation(BuyerQuotation updatedQuotation) {
        // Save the updated quotation details
        quotationService.saveQuotation(updatedQuotation);
        return "redirect:/view_quotations"; // Redirect to the view quotations page after saving
    }
    
    @GetMapping("/Apply-bid")
    public String ShowApplyBid(HttpSession session, Model model) {
        // Get vendorId from session attribute
        Integer vendorId = (Integer) session.getAttribute("vendorid");

        if (vendorId != null) {
            // Fetch quotations based on vendorId and status not being 'Applied'
            List<BuyerQuotation> quotations = quotationService.findQuotationsByVendorIdAndStatusNotApplied(vendorId);
            model.addAttribute("quotations", quotations);
        } else {
            model.addAttribute("error", "Vendor not logged in.");
        }
        return "Apply-bid"; 
    }
    
    
    @PostMapping("/Apply-bid")
    public String saveUpdatedApplyBid(@ModelAttribute("buyerQuotation") BuyerQuotation buyerQuotation,
                                        @RequestParam("status") String status, Model model) {
        
        buyerQuotation.setStatus(status);

        // Calculate total price and save the quotation
        buyerQuotation.calculateTotalPrice();
        quotationService.saveQuotation(buyerQuotation);
        
        model.addAttribute("successMessage", "Bid saved successfully");
        return "redirect:/Apply-bid"; 
    }
    
    @GetMapping("/Applied-bids")
    public String ShowAppliedBid(HttpSession session, Model model) {
        // Get vendorId from session attribute
    	 Integer vendorId = (Integer) session.getAttribute("vendorid");

         if (vendorId != null) {
             
             List<BuyerQuotation> quotations = quotationService.findQuotationsByVendorIdAndStatusApplied(vendorId);
             model.addAttribute("quotations", quotations);
         } else {
             model.addAttribute("error", "Vendor not logged in.");
         }
         return "Applied-bids";  
    }
    
    @PostMapping("/Applied-bids")
    public String saveUpdatedAppliedBid(@ModelAttribute("buyerQuotation") BuyerQuotation buyerQuotation,
                                        @RequestParam("status") String status, Model model) {
        // Set the status from the request
        buyerQuotation.setStatus(status);

        // Calculate total price and save the quotation
        buyerQuotation.calculateTotalPrice();
        quotationService.saveQuotation(buyerQuotation);
        
        model.addAttribute("successMessage", "Bid saved successfully");
        return "redirect:/Applied-bids"; 
    }
    
    @GetMapping("/bid-application")
    public String showBidApplication( Model model) {
        return "bid-application"; // The name of the JSP file for editing
    }
    @PostMapping("/bid-application")
    public String saveUpdateBid(BuyerQuotation updatedQuotation) {
        // Save the updated quotation details
        quotationService.saveQuotation(updatedQuotation);
        return "redirect:/Apply-bid"; // Redirect to the view quotations page after saving
    }
    
    @GetMapping("/quotation-bids")
    public String viewQuotationBids(Model model) {
        List<BuyerQuotation> quotations = quotationService.getQuotationsWithVendorIdZero();
        model.addAttribute("quotations", quotations);
        return "quotation-bids"; 
    }
    
    @PostMapping("/quotation-bids")
    public String saveUpdatedBid(@RequestParam("status") String status,
                                 @RequestParam("quotationId") int quotationId,
                                 @RequestParam("vendorId") int vendorId,
                                 Model model) {
        // Retrieve the bid using quotationId and vendorId (assuming you have a method to find the bid)
        BuyerQuotation bid = quotationService.findBidByQuotationIdAndVendorId(quotationId,vendorId);

        // Set the updated status before saving
        if (bid != null) {
            bid.setStatus(status);
            // Save the updated quotation
            quotationService.saveQuotation(bid);
        }

        return "redirect:/admin_dashboard"; // Redirect after saving
    }


    @GetMapping("/edit-quotation-bids")
    public String viewEditQuotationBids(HttpSession session,@RequestParam("quotationId") int quotationId,Model model) {
    	Integer adminId = (Integer) session.getAttribute("adminid");
        List<BuyerQuotation> quotations = quotationService.displayAppliedBids(quotationId,adminId);
        model.addAttribute("quotations", quotations);
        return "edit-quotation-bids"; 
    }
    
    @GetMapping("/buyer-quotation-bids")
    public String viewbuyerQuotationBids(Model model) {
        List<BuyerQuotation> quotations = quotationService.getQuotationsWithVendorIdZero();
        model.addAttribute("quotations", quotations);
        return "buyer-quotation-bids"; 
    }
    
    @PostMapping("/buyer-quotation-bids")
    public String saveBuyerUpdatedBid(@RequestParam("status") String status,
                                 @RequestParam("quotationId") int quotationId,
                                 @RequestParam("vendorId") int vendorId,
                                 Model model) {
        // Retrieve the bid using quotationId and vendorId (assuming you have a method to find the bid)
        BuyerQuotation bid = quotationService.findBidByQuotationIdAndVendorId(quotationId,vendorId);

        // Set the updated status before saving
        if (bid != null) {
            bid.setStatus(status);
            // Save the updated quotation
            quotationService.saveQuotation(bid);
        }

        return "redirect:/buyer_dashboard"; // Redirect after saving
    }
    
    @GetMapping("/edit-buyer-quotation-bids")
    public String viewEditBuyerQuotationBids(HttpSession session,@RequestParam("quotationId") int quotationId,Model model) {
    	Integer buyerId = (Integer) session.getAttribute("empid");
        List<BuyerQuotation> quotations = quotationService.displayBidsForBuyer(quotationId,buyerId);
        model.addAttribute("quotations", quotations);
        return "edit-buyer-quotation-bids"; 
    }
    
    @GetMapping("/buyer-approved-bids")
    public String viewBuyerApprovedBids(@RequestParam("quotationId") int quotationId,Model model) {
        List<BuyerQuotation> quotations = quotationService.displayBuyerApprovedBids(quotationId);
        model.addAttribute("quotations", quotations);
        return "buyer-approved-bids"; 
    }
    
    @PostMapping("/buyer-approved-bids")
    public String saveBuyerApprovedBid(@RequestParam("status") String status,
                                 @RequestParam("quotationId") int quotationId,
                                 @RequestParam("vendorId") int vendorId,
                                 Model model) {
        // Retrieve the bid using quotationId and vendorId (assuming you have a method to find the bid)
        BuyerQuotation bid = quotationService.findBidByQuotationIdAndVendorId(quotationId,vendorId);

        // Set the updated status before saving
        if (bid != null) {
            bid.setStatus(status);
            // Save the updated quotation
            quotationService.saveQuotation(bid);
        }

        return "redirect:/buyer_dashboard"; // Redirect after saving
    }
    
    @GetMapping("/buyer-approved-quotation-bids")
    public String viewbuyerApprovedQuotationBids(Model model) {
        List<BuyerQuotation> quotations = quotationService.getQuotationsWithVendorIdZero();
        model.addAttribute("quotations", quotations);
        return "buyer-approved-quotation-bids"; 
    }
    @GetMapping("/vendor-bids")
    public String viewVendorBids(HttpSession session,Model model)
    {
    	Integer vendorId=(Integer)session.getAttribute("vendorid");
    	List<BuyerQuotation> bids=quotationService.getVendorBids(vendorId);
    	model.addAttribute("quotations",bids);
    	return "vendor-bids";
    }
    
    @PostMapping("/result")
    public String showResult(@RequestParam("quotationId") int quotationId, HttpSession session, Model model) {
        Integer vendorId = (Integer) session.getAttribute("vendorid");
        
        // Handle case where vendorId might be null
        if (vendorId == null) {
            return "redirect:/vendor-login"; // Redirect or handle the error appropriately
        }
        
        String result = quotationService.getResult(quotationId, vendorId);
        
        // Add the quotationId to the model with a key
        model.addAttribute("quotationId", quotationId); 

        // Check result and return appropriate view
        if ("success".equals(result)) { 
            return "success"; // This should map to your success.jsp
        } else { 
            return "reject"; // This should map to your reject.jsp
        }
    }
}
