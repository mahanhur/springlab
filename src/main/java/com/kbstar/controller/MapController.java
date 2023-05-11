package com.kbstar.controller;

import com.kbstar.dto.Marker;
import com.kbstar.dto.MarkerDesc;
import com.kbstar.service.MarkerDescService;
import com.kbstar.service.MarkerService;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/map")
public class MapController {

    @Autowired
    MarkerService markerService;
    @Autowired
    MarkerDescService markerDescService;

//    Logger logger = LoggerFactory.getLogger(this.getClass().getSimpleName());
    String dir = "map/";
    @RequestMapping("")
    public String main(Model model) {
        model.addAttribute("center", dir+"center");
        model.addAttribute("left", dir+"left");
        return "index";
    }
    @RequestMapping("/map01")
    public String map01(Model model) {
        model.addAttribute("center", dir+"map01");
        model.addAttribute("left", dir+"left");
        return "index";
    }
    @RequestMapping("/map02")
    public String map02(Model model) {
        model.addAttribute("center", dir+"map02");
        model.addAttribute("left", dir+"left");
        return "index";
    }
    @RequestMapping("/map03")
    public String map03(Model model) {
        model.addAttribute("center", dir+"map03");
        model.addAttribute("left", dir+"left");
        return "index";
    }
    @RequestMapping("/map04")
    public String map04(Model model) {
        model.addAttribute("center", dir+"map04");
        model.addAttribute("left", dir+"left");
        return "index";
    }
    @RequestMapping("/map05")
    public String map05(Model model) {
        model.addAttribute("center", dir+"map05");
        model.addAttribute("left", dir+"left");
        return "index";
    }

    @RequestMapping("/detail")
    public String map05(Model model, int id) throws Exception {
        Marker marker = null;
        List<MarkerDesc> markerDesc = null;
        try {
            marker = markerService.get(id);
            markerDesc = markerDescService.getMarkerDesc(id);
        } catch (Exception e) {
            throw new Exception("시스템 장애");
        }
        model.addAttribute("gmarker", marker);
        model.addAttribute("markerd", markerDesc);
        model.addAttribute("center", dir+"detail");
        model.addAttribute("left", dir+"left");
        return "index";
    }


}
