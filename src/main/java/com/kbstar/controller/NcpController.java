package com.kbstar.controller;

import com.kbstar.dto.Ncp;
import com.kbstar.utility.CFRCelebrityUtil;
import com.kbstar.utility.CFRFaceUtil;
import com.kbstar.utility.FileUploadUtil;
import com.kbstar.utility.OCRUtil;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
public class NcpController {

    @Value("${uploadimgdir}")
    String imgpath;
    @Autowired
    CFRCelebrityUtil celebrityUtil;
    @Autowired
    CFRFaceUtil faceUtil;

    @RequestMapping("/cfr1impl")
    public String cfr1impl(Model model, Ncp ncp) throws Exception {
        //이미지를 저장한다
        MultipartFile mf = ncp.getImg();
        FileUploadUtil.saveFile(mf, imgpath);

        String imgname = mf.getOriginalFilename();

        //NCP에 요청한다

        JSONObject result = (JSONObject) celebrityUtil.getResult(imgpath,imgname);

        //결과를 깐다
        JSONArray faces = (JSONArray) result.get("faces");
        JSONObject obj = (JSONObject) faces.get(0);
        JSONObject celebrity = (JSONObject) obj.get("celebrity");
        String value = (String) celebrity.get("value");
        Double confidence = (Double) celebrity.get("confidence");

        //결과를 보낸다
        model.addAttribute("result", value);
        model.addAttribute("confidence", confidence);
        model.addAttribute("center", "cfr1");
        return "index";
    }

    @RequestMapping("/cfr2impl")
    public String cfr2impl(Model model, Ncp ncp) throws Exception {
        //이미지를 저장한다
        MultipartFile mf = ncp.getImg();
        FileUploadUtil.saveFile(mf, imgpath);

        String imgname = mf.getOriginalFilename();

        //NCP에 요청한다
        JSONObject result = (JSONObject) faceUtil.getResult(imgpath,imgname);

        //결과를 깐다
        JSONArray faces = (JSONArray) result.get("faces");
        JSONObject obj = (JSONObject) faces.get(0);

        JSONObject gender = (JSONObject) obj.get("gender");
        String value1 = (String) gender.get("value");
        JSONObject age = (JSONObject) obj.get("age");
        String value2 = (String) age.get("value");
        JSONObject emotion = (JSONObject) obj.get("emotion");
        String value3 = (String) emotion.get("value");
        JSONObject pose = (JSONObject) obj.get("pose");
        String value4 = (String) pose.get("value");

        Map<String, String> map = new HashMap<>();
        map.put("gender", value1);
        map.put("age", value2);
        map.put("emotion", value3);
        map.put("pose", value4);


//        Double confidence = (Double) celebrity.get("confidence");

        //결과를 보낸다
        model.addAttribute("result", map);
//        model.addAttribute("confidence", confidence);
        model.addAttribute("center", "cfr2");
        return "index";
    }
    @RequestMapping("/mycfr")
    public String mycfr(Model model, String imgname) throws Exception {

        //NCP에 요청한다
        JSONObject result = (JSONObject) faceUtil.getResult(imgpath,imgname);

        //결과를 깐다
        JSONArray faces = (JSONArray) result.get("faces");
        JSONObject obj = (JSONObject) faces.get(0);

        JSONObject gender = (JSONObject) obj.get("gender");
        String value1 = (String) gender.get("value");
        JSONObject age = (JSONObject) obj.get("age");
        String value2 = (String) age.get("value");
        JSONObject emotion = (JSONObject) obj.get("emotion");
        String value3 = (String) emotion.get("value");
        JSONObject pose = (JSONObject) obj.get("pose");
        String value4 = (String) pose.get("value");

        Map<String, String> map = new HashMap<>();
        map.put("gender", value1);
        map.put("age", value2);
        map.put("emotion", value3);
        map.put("pose", value4);


//        Double confidence = (Double) celebrity.get("confidence");

        //결과를 보낸다
        model.addAttribute("result", map);
//        model.addAttribute("confidence", confidence);
        model.addAttribute("center", "pic");
        return "index";
    }
    @RequestMapping("/ocr1impl")
    public String ocr1impl(Model model, Ncp ncp) throws Exception {

        MultipartFile mf = ncp.getImg();
        FileUploadUtil.saveFile(mf, imgpath);

        String imgname = mf.getOriginalFilename();

        JSONObject jo = null;
        Map map = null;

        jo = (JSONObject) OCRUtil.getResult(imgpath, imgname);
        map = OCRUtil.getData(jo);

        model.addAttribute("result", map);
//        model.addAttribute("confidence", confidence);
        model.addAttribute("center", "ocr1");
        return "index";
    }

    @RequestMapping("/ocr2impl")
    public String ocr2impl(Model model, Ncp ncp) throws Exception {

        MultipartFile mf = ncp.getImg();
        FileUploadUtil.saveFile(mf, imgpath);

        String imgname = mf.getOriginalFilename();

        JSONObject jo = null;
        Map map = null;

        jo = (JSONObject) OCRUtil.getResult(imgpath, imgname);
        map = OCRUtil.getData(jo);

        model.addAttribute("result", map);
//        model.addAttribute("confidence", confidence);
        model.addAttribute("center", "ocr2");
        return "index";
    }

}
