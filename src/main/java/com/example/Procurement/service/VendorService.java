package com.example.Procurement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.Procurement.model.Vendor;
import com.example.Procurement.repository.VendorRepository;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
@Service
public class VendorService {

    @Autowired
    private VendorRepository vendorRepository;

    @Autowired
    private JavaMailSender emailSender; // Add this line

    public Vendor registerVendor(Vendor vendor) {
        return vendorRepository.save(vendor);
    }

    public Vendor findByUsername(String username) {
        return vendorRepository.findByUsername(username); 
    }

    public List<Vendor> getAllVendors() {
        return vendorRepository.findAll();
    }

    public void sendEmail(String to, String subject, String text) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(to);
        message.setSubject(subject);
        message.setText(text);
        emailSender.send(message); // Use emailSender here
        System.out.println("Mail sent successfully");
    }
}
