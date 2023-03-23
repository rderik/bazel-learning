package com.rderik.javatool.main;

import com.rderik.javatool.calculator.Calculator;
import io.javalin.Javalin;

import java.util.Random;

public class JavaTool {
    private static final int MIN = 0;
    private static final int MAX = 100;

    public static void main(String[] args) {
        Javalin app = Javalin.create()
            .get("/", ctx -> ctx.result(getRandomSum()))
            .start(7070);
    }

    public static String getRandomSum() {
      
      int x = new Random().nextInt(MAX - MIN + 1) + MIN;
      int y = new Random().nextInt(MAX - MIN + 1) + MIN;
      return "Random sum: " + Integer.toString(Calculator.add(x,y));
    }

}

