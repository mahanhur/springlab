package com.kbstar.ncp;

import com.kbstar.utility.CFRCelebrityUtil;
import com.kbstar.utility.CFRFaceUtil;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class CFRFaceTests {
    @Value("${uploadimgdir}")
    String imgpath;

    @Test
    void contextLoads() throws Exception {
        String imgname = "lee.jpg";
        JSONObject result = (JSONObject) CFRFaceUtil.getResult(imgpath,imgname);
        log.info(result.toJSONString());
    }

}
