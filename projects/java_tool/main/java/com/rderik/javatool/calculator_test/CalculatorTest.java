package com.rderik.javatool.calculator_test;
  
import static org.junit.Assert.*;  
import org.junit.Test;  

import com.rderik.javatool.calculator.Calculator;
  
public class CalculatorTest {  
  
    @Test  
    public void testAddition(){  
        assertEquals(4,Calculator.add(1,3));  
    }  
}  
