package com.example.Procurement.model;

import jakarta.persistence.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "quotations")
public class BuyerQuotation {

    @EmbeddedId
    private QuotationHelper id;  // Composite primary key

    private int buyerId;
    private int adminId;
    private String currency;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date quotationStartDate;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date quotationEndDate;

    private BigDecimal igst;
    private BigDecimal cgst;
    private BigDecimal sgst;
    private String itemName;
    private int quantity;
    private BigDecimal unitPrice;
    private BigDecimal totalPrice;
    private String status;

    // Default constructor
    public BuyerQuotation() {
        this.id = new QuotationHelper(); // Initialize with default values
        this.id.setVendorId(0); // Set default vendorId
    }

    public BuyerQuotation(int quotationId, int buyerId, int adminId, String currency,
                          Date quotationStartDate, Date quotationEndDate, BigDecimal igst,
                          BigDecimal cgst, BigDecimal sgst, String itemName,
                          int quantity, BigDecimal unitPrice, BigDecimal totalPrice, String status) {
        this.id = new QuotationHelper(quotationId, 0); // Set vendorId to 0
        this.buyerId = buyerId;
        this.adminId = adminId;
        this.currency = currency;
        this.quotationStartDate = quotationStartDate;
        this.quotationEndDate = quotationEndDate;
        this.igst = igst;
        this.cgst = cgst;
        this.sgst = sgst;
        this.itemName = itemName;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.totalPrice = totalPrice;
        this.status = status;
    }

    // Getters and Setters
    public QuotationHelper getId() {
        return id;
    }

    public void setId(QuotationHelper id) {
        this.id = id;
    }

    public int getBuyerId() {
        return buyerId;
    }

    public void setBuyerId(int buyerId) {
        this.buyerId = buyerId;
    }

    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    public Date getQuotationStartDate() {
        return quotationStartDate;
    }

    public void setQuotationStartDate(Date quotationStartDate) {
        this.quotationStartDate = quotationStartDate;
    }

    public Date getQuotationEndDate() {
        return quotationEndDate;
    }

    public void setQuotationEndDate(Date quotationEndDate) {
        this.quotationEndDate = quotationEndDate;
    }

    public BigDecimal getIgst() {
        return igst;
    }

    public void setIgst(BigDecimal igst) {
        this.igst = igst;
    }

    public BigDecimal getCgst() {
        return cgst;
    }

    public void setCgst(BigDecimal cgst) {
        this.cgst = cgst;
    }

    public BigDecimal getSgst() {
        return sgst;
    }

    public void setSgst(BigDecimal sgst) {
        this.sgst = sgst;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(BigDecimal unitPrice) {
        this.unitPrice = unitPrice;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    // Method to calculate the total price
    public void calculateTotalPrice() {
        BigDecimal taxMultiplier = BigDecimal.valueOf(1 + (igst.add(cgst).add(sgst)).doubleValue() / 100);
        this.totalPrice = unitPrice.multiply(BigDecimal.valueOf(quantity)).multiply(taxMultiplier);
    }
}
