package com.example.Procurement.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.Procurement.model.Vendor;

public interface VendorRepository extends JpaRepository<Vendor, Integer> {

    Vendor findByUsername(String username);

    Vendor findByUsernameAndPassword(String username, String password);
}
