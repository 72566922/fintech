package com.fintech.mujer_fintech;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals; // Importa assertEquals de JUnit

public class ExampleTest {
    
    @Test
    public void testSumar() {
        Example example = new Example();
        
        int result = example.sumar(4, 4);
        
        assertEquals(8, result); // Ahora deberías poder usar assertEquals sin problemas
    }
}
