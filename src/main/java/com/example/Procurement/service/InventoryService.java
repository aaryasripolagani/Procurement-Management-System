package com.example.Procurement.service;

import com.example.Procurement.model.Inventory;
import com.example.Procurement.repository.InventoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class InventoryService {

    @Autowired
    private InventoryRepository inventoryRepository;

    public List<Inventory> getAllItems() {
        return inventoryRepository.findAll();
    }

    public Inventory getItemById(int id) {
        Optional<Inventory> result = inventoryRepository.findById(id);
        return result.orElse(null);
    }

    public void saveItem(Inventory inventory) {
        inventoryRepository.save(inventory);
    }

    public void deleteItem(int itemId) {
        inventoryRepository.deleteById(itemId);
    }
}
