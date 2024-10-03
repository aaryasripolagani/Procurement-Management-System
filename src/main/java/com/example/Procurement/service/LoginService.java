package com.example.Procurement.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.Procurement.model.Admin;
import com.example.Procurement.model.Employee;
import com.example.Procurement.model.Vendor;
import com.example.Procurement.repository.AdminRepository;
import com.example.Procurement.repository.EmployeeRepository;
import com.example.Procurement.repository.VendorRepository;

@Service
public class LoginService {

    @Autowired
    private EmployeeRepository employeeRepository;

    @Autowired
    private AdminRepository adminRepository;

    @Autowired
    private VendorRepository vendorRepository;

    public Employee verifyEmployeeLogin(String username, String password) {
        Employee employee = employeeRepository.findByUsernameAndPassword(username, password);
        return employee;
    }

    public Admin verifyAdminLogin(String username, String password) {
        Admin admin = adminRepository.findByUsernameAndPassword(username, password);
        return admin;
    }

    public Vendor verifyVendorLogin(String username, String password) {
        Vendor vendor = vendorRepository.findByUsernameAndPassword(username, password);
        return vendor ;
    }
}
