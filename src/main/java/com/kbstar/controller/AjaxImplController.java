package com.kbstar.controller;

import com.kbstar.dto.Cust;
import com.kbstar.dto.Marker;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

@RestController
public class AjaxImplController {
    @RequestMapping("/getservertime")
    public Object getservertime() {
        Date date = new Date();
        return date;
    }
    @RequestMapping("/checkid")
    public Object checkid(String id) {
        int result = 0;
        if(id.equals("qqqq") || id.equals("aaaa") || id.equals("ssss")) {
            result = 1;
        }
        return result;
    }
    @RequestMapping("/getdata")
    public Object getdata() {

        List<Cust> list = new ArrayList<>();
        list.add(new Cust("id01", "pwd01", "james1"));
        list.add(new Cust("id02", "pwd02", "james2"));
        list.add(new Cust("id03", "pwd03", "james3"));
        list.add(new Cust("id04", "pwd04", "james4"));
        list.add(new Cust("id05", "pwd05", "james5"));

        JSONArray ja = new JSONArray();
        JSONObject jo = new JSONObject();

        for(Cust obj:list) {
            Random r = new Random();
            int i = r.nextInt(100)+1;
            jo.put("id",obj.getId());
            jo.put("pwd",obj.getPwd());
            jo.put("name",obj.getName()+i);
            ja.add(jo);
        }

        return ja;
    }

    @RequestMapping("/markers")
    public Object markers(String loc) {
        List<Marker> list = new ArrayList<>();
        if(loc.equals("s")) {
            list.add(new Marker(100, "국밥", "http://www.nate.com",37.577209, 126.972814, "a.jpg", "s"));
            list.add(new Marker(101, "짬뽕", "http://www.naver.com",37.574209, 126.971814, "b.jpg", "s"));
            list.add(new Marker(102, "껍데기", "http://www.daum.net",37.579209, 126.972214, "c.jpg", "s"));
        } else if(loc.equals("b")) {
            list.add(new Marker(103, "밥국", "http://www.nate.com",35.157439, 129.051139, "a.jpg", "b"));
            list.add(new Marker(104, "뽕짬", "http://www.naver.com",35.157239, 129.052139, "b.jpg", "b"));
            list.add(new Marker(105, "데기껍", "http://www.daum.net",35.157839, 129.053139, "c.jpg", "b"));
        } else if(loc.equals("j")) {
            list.add(new Marker(106, "박북", "http://www.nate.com",33.362666, 126.525166, "a.jpg", "j"));
            list.add(new Marker(107, "빵쫌", "http://www.naver.com",33.363666, 126.525166, "b.jpg", "j"));
            list.add(new Marker(108, "기데껍", "http://www.daum.net",33.364666, 126.521166, "c.jpg", "j"));
        };

        JSONArray ja = new JSONArray();
        for(Marker obj:list){
            JSONObject jo = new JSONObject();
            jo.put("id", obj.getId());
            jo.put("title", obj.getTitle());
            jo.put("target", obj.getTarget());
            jo.put("lat", obj.getLat());
            jo.put("lng", obj.getLng());
            jo.put("img", obj.getImg());
            jo.put("loc", obj.getLoc());
            ja.add(jo);
        }
        return ja;
        }
    @RequestMapping("/chart05")
    public Object chart05(String year) {
        JSONArray ja = new JSONArray();
        for(int i=1;i<=12;i++) {
            Random r = new Random();
            int num = r.nextInt(100)+1;
            ja.add(num);
        }
        return ja;
    }
}

