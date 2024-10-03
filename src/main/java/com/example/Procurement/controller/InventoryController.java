package com.example.Procurement.controller;

import com.example.Procurement.model.Inventory;
import com.example.Procurement.service.InventoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class InventoryController {

    @Autowired
    private InventoryService inventoryService;
    

    // Mapping for managing inventory actions (add, delete, update)
    @GetMapping("/manage-inventory")
    public String manageInventoryPage(Model model) {
    	model.addAttribute("inventoryList", inventoryService.getAllItems());
        return "manage-inventory"; // Main page with Add/Delete/Update buttons
    }

    @GetMapping("/manage-inventory/add-item")
    public String showAddItemForm(Model model) {
        model.addAttribute("inventory", new Inventory());
        return "add-item";
    }

    @PostMapping("/manage-inventory/add-item")
    public String addItem(@ModelAttribute Inventory inventory) {
        inventoryService.saveItem(inventory);
        return "redirect:/manage-inventory";  // Redirect to view inventory after adding
    }

    @GetMapping("/manage-inventory/delete-item")
    public String showDeleteItemForm(Model model) {
        model.addAttribute("inventoryList", inventoryService.getAllItems());
        return "delete-item";
    }

    @PostMapping("/manage-inventory/delete-item")
    public String deleteItem(@RequestParam("itemId") int itemId) {
        inventoryService.deleteItem(itemId);
        return "redirect:/manage-inventory";  // Redirect to view inventory after deletion
    }

    @GetMapping("/manage-inventory/edit-item")
    public String showEditItemForm( Model model) {
    	model.addAttribute("inventoryList", inventoryService.getAllItems());
        return "edit-item";
    }
    
    @PostMapping("/manage-inventory/edit-item")
    public String updateItem(@ModelAttribute Inventory inventory) {
        inventoryService.saveItem(inventory); // Save the updated item to the database
        return "redirect:/manage-inventory";  // Redirect to the manage inventory page after updating
    }
    
    @GetMapping("/manage-inventory/edit-item-form")
    public String showEditItemForm(@RequestParam("itemId") int itemId, Model model) {
        Inventory item = inventoryService.getItemById(itemId);
        model.addAttribute("inventory", item);
        return "edit-item-form";  // The page where item details can be edited
    }
    
   
  
   

}
