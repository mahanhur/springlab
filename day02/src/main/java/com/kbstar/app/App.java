package com.kbstar.app;

import com.kbstar.frame.TV;
import com.kbstar.tv.LTV;
import com.kbstar.tv.STV;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class App {
    public static void main(String arg[]) {
        ApplicationContext factory =
                new ClassPathXmlApplicationContext("spring.xml");

        TV tv =
                (TV) factory.getBean("ltv");
        tv.turnOn();

    }
}
