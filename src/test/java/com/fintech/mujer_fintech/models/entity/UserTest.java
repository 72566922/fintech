package com.fintech.mujer_fintech.models.entity;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

public class UserTest {

    private User user;

    @BeforeEach
    public void setUp() {
        user = new User();
    }

    @Test
    public void testGettersAndSetters() {
        // Arrange
        user.setId(1L);
        user.setUsername("testuser");
        user.setPassword("password123");
        user.setGmail("testuser@gmail.com");
        user.setFullname("Test User");
        user.setEnabled(true);

        // Act & Assert
        assertEquals(1L, user.getId());
        assertEquals("testuser", user.getUsername());
        assertEquals("password123", user.getPassword());
        assertEquals("testuser@gmail.com", user.getGmail());
        assertEquals("Test User", user.getFullname());
        assertTrue(user.isEnabled());
    }

    @Test
    public void testInitialState() {
        // Assert initial values
        assertNull(user.getId());
        assertNull(user.getUsername());
        assertNull(user.getPassword());
        assertNull(user.getGmail());
        assertNull(user.getFullname());
        assertFalse(user.isEnabled());
    }
}
