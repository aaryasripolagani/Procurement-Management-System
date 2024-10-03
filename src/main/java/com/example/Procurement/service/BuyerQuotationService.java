package com.example.Procurement.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.*;
import com.example.Procurement.model.BuyerQuotation;
import com.example.Procurement.model.QuotationHelper;
import com.example.Procurement.repository.BuyerQuotationRepository;

@Service
public class BuyerQuotationService {

    @Autowired
    private BuyerQuotationRepository repository;

    public BuyerQuotation saveQuotation(BuyerQuotation quotation) {
        // Ensure the vendorId is set correctly (it will be passed from the form)
        if (quotation.getId().getVendorId() == 0) {
            quotation.getId().setVendorId(0); // Assuming 0 is your default
        }

        // Calculate the total price
        quotation.calculateTotalPrice(); // Using method to calculate total price

        // Save and return the quotation
        return repository.save(quotation);
    }
    
    
    public BuyerQuotation findById(int quotationId, int vendorId) {
        QuotationHelper id = new QuotationHelper(quotationId, vendorId);
        Optional<BuyerQuotation> quotationOpt = repository.findById(id);
        return quotationOpt.orElse(null); 
    }
    
    public List<BuyerQuotation> getQuotationsWithVendorIdZero() {
        return repository.findByIdVendorId(0); // vendorId is 0
    }
    
    public List<BuyerQuotation> findQuotationsByVendorIdAndStatusNotApplied(int vendorId) {
        return repository.findByVendorIdAndStatusNotApplied(vendorId);
    }
    
    public List<BuyerQuotation> findQuotationsByVendorIdAndStatusApplied(int vendorId) {
        return repository.findByVendorIdAndStatusApplied(vendorId);
    }
    
    public List<BuyerQuotation> displayAppliedBids(int quotationId, Integer adminId) {
        return repository.displayAppliedBids(quotationId,adminId.intValue());
    }


    public List<BuyerQuotation> displayBidsForBuyer(int quotationId, Integer buyerId) {
        return repository.displayBidsForBuyer(quotationId,buyerId.intValue());
    }
    
	public BuyerQuotation findBidByQuotationIdAndVendorId(int quotationId, int vendorId) {
		return repository.findByQuotationIdAndVendorId(quotationId,vendorId);
	}


	public List<BuyerQuotation> displayBuyerApprovedBids(int quotationId) {
		return repository.displayBuyerApprovedBids(quotationId);
	}



	public List<BuyerQuotation> getAdminQuotations(Integer adminId) {
		return repository.getAdminQuotations(adminId.intValue());
	}


	public List<BuyerQuotation> getAdminApprovedQuotations(Integer adminId) {
		return repository.getAdminApprovedQuotations(adminId.intValue());
	}


	public List<BuyerQuotation> getAdminRejectedQuotations(Integer adminId) {
		return repository.getAdminRejectedQuotations(adminId.intValue());
	}


	public List<BuyerQuotation> getVendorBids(Integer vendorId) {
		return repository.getVendorBids(vendorId.intValue());
	}


	public String getResult(int quotationId, Integer vendorId) {
		BuyerQuotation result=repository.getResult(quotationId,vendorId.intValue());
		if(result.getStatus().equals("Final Acknowledgement"))
		{
			return "success";
		}
		if(result.getStatus().contains("Rejected"))
		{
			return "fail";
		}
		return result.getStatus();
	}


	public int getempid(int quotationId, int vendorId) {
		return repository.getempid(quotationId,vendorId);
	}


	public BuyerQuotation findRow(int quotationId, int empid, Integer vendorId) {
		return repository.findRow(quotationId,empid,vendorId);
	}
	
	



}

