package com.example.Procurement.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.Procurement.model.Employee;

@Repository
public interface EmployeeRepository extends JpaRepository<Employee, Integer> {
    Employee findByUsernameAndPassword(String username, String password);
    
    @Query("SELECT e.email FROM Employee e WHERE e.id = :empId")
    String getempemail(@Param("empId") int empId);
}

