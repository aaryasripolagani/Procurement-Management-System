package com.example.Procurement.model;

import jakarta.persistence.*;
import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class QuotationHelper implements Serializable {
    private int quotationId;
    private int vendorId;

    // Default constructor
    public QuotationHelper() {}

    // Constructor
    public QuotationHelper(int quotationId, int vendorId) {
        this.quotationId = quotationId;
        this.vendorId = vendorId;
    }

    // Getters and setters
    public int getQuotationId() {
        return quotationId;
    }

    public void setQuotationId(int quotationId) {
        this.quotationId = quotationId;
    }

    public int getVendorId() {
        return vendorId;
    }

    public void setVendorId(int vendorId) {
        this.vendorId = vendorId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof QuotationHelper)) return false;
        QuotationHelper that = (QuotationHelper) o;
        return quotationId == that.quotationId && vendorId == that.vendorId;
    }

    @Override
    public int hashCode() {
        return Objects.hash(quotationId, vendorId);
    }
}
