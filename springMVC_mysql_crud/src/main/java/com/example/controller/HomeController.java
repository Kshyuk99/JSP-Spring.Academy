package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {
    
    @GetMapping("/")
    public String home() {
        return "redirect:/tasks";
    }
    
    @GetMapping("/form2")
    public String form2() {
    	return "task/form2";
    }	
    
    @GetMapping("/result")
    public String result(@RequestParam String name, Model model) {
    	System.out.println(name);
    	model.addAttribute("name", name);
    	return "task/result";
    }
    
    @PostMapping("/result")
    public String result1(@RequestParam String name, Model model) {
    	System.out.println(name);
    	model.addAttribute("name", name);
    	return "task/result";
    }
} 