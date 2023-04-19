package com.kbstar.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
    @RequestMapping("/")
    public String main() {
        return "index";
    }
    @RequestMapping("/next")
    public String next(Model model) {
        model.addAttribute("mydata", "Hi");
        return "next";
    }
    @RequestMapping("/second")
    public String second(Model model) {
        return "second";
    }
}
