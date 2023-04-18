package com.kbstar.tv;

import com.kbstar.frame.TV;

public class LTV implements TV {

    @Override
    public void turnOn() {
        System.out.println("Ltv Turn On");
    }

    @Override
    public void turnOff() {
        System.out.println("Ltv Turn Off");

    }
}
