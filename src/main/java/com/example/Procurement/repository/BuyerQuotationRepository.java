package com.example.Procurement.repository;

import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.Procurement.model.QuotationHelper;
import com.example.Procurement.model.BuyerQuotation;

public interface BuyerQuotationRepository extends JpaRepository<BuyerQuotation, QuotationHelper> {
    
    List<BuyerQuotation> findByIdVendorId(int vendorId);

    Optional<BuyerQuotation> findById(QuotationHelper id);
    
    @Query("SELECT bq FROM BuyerQuotation bq WHERE bq.id.vendorId = :vendorId AND bq.status = 'Approved by admin'")
    List<BuyerQuotation> findByVendorIdAndStatusNotApplied(int vendorId);
    
    @Query("SELECT bq FROM BuyerQuotation bq WHERE bq.id.vendorId = :vendorId AND bq.status = 'Applied'")
    List<BuyerQuotation> findByVendorIdAndStatusApplied(int vendorId);
    
    @Query("SELECT bq FROM BuyerQuotation bq WHERE bq.id.quotationId = :quotationId AND bq.id.vendorId != 0 AND bq.status = 'Applied' AND bq.adminId=:adminId")
    List<BuyerQuotation> displayAppliedBids(int quotationId, int adminId);
    
    @Query("SELECT bq FROM BuyerQuotation bq WHERE bq.id.quotationId = :quotationId AND bq.id.vendorId = :vendorId")
    BuyerQuotation findByQuotationIdAndVendorId(int quotationId,int vendorId);

	@Query("SELECT bq FROM BuyerQuotation bq WHERE bq.id.quotationId = :quotationId AND bq.id.vendorId != 0 AND bq.status Like 'Admin Verified%' AND bq.buyerId=:buyerId")
    List<BuyerQuotation> displayBidsForBuyer(int quotationId, int buyerId);
	
	@Query("SELECT bq FROM BuyerQuotation bq WHERE bq.id.quotationId = :quotationId AND bq.id.vendorId != 0 AND bq.status Like 'Buyer Verified%'")
	List<BuyerQuotation> displayBuyerApprovedBids(int quotationId);
	
	@Query("SELECT bq FROM BuyerQuotation bq WHERE bq.id.vendorId =0 AND bq.adminId =:adminId")
	List<BuyerQuotation> getAdminQuotations(int adminId);
	
	@Query("SELECT bq FROM BuyerQuotation bq WHERE bq.id.vendorId =0 AND bq.adminId =:adminId AND bq.status='Approved by admin'")
	List<BuyerQuotation> getAdminApprovedQuotations(int adminId);
	
	@Query("SELECT bq FROM BuyerQuotation bq WHERE bq.id.vendorId =0 AND bq.adminId =:adminId AND bq.status='Rejected by admin'")
	List<BuyerQuotation> getAdminRejectedQuotations(int adminId);

	@Query("Select bq from BuyerQuotation bq where bq.id.vendorId=:VendorId")
	List<BuyerQuotation> getVendorBids(int VendorId);
	
	@Query("Select bq from BuyerQuotation bq where bq.id.quotationId=:quotationId and bq.id.vendorId=:vendorId")
	BuyerQuotation getResult(int quotationId, int vendorId);
	
	@Query("select bq from BuyerQuotation bq where bq.id.quotationId=:quotationId and bq.buyerId=:buyerId and bq.id.vendorId=:vendorId")
	BuyerQuotation findRow(int quotationId,int buyerId,int vendorId);

	@Query("select buyerId from BuyerQuotation bq where bq.id.quotationId=:quotationId and bq.id.vendorId=:vendorId")
	int getempid(int quotationId, int vendorId);

	

}
