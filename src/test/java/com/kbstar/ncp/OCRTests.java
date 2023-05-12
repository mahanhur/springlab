package com.kbstar.ncp;

import com.kbstar.utility.OCRUtil;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.util.HashMap;
import java.util.Map;

@Slf4j
@SpringBootTest
class OCRTests {

    @Value("${uploadimgdir}")
    String imgpath;
    @Test
    void contextLoads() throws Exception {
        JSONObject jo = null;
        Map map = null;

        jo = (JSONObject) OCRUtil.getResult(imgpath, "bab1.jpg");
        log.info(String.valueOf(jo));
//
//        map = OCRUtil.getData(jo);
//        log.info(map.values().toString());
       }

}
