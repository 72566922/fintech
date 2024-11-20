package com.fintech.mujer_fintech.models.service.userRoles;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fintech.mujer_fintech.models.entity.User;
import com.fintech.mujer_fintech.models.repository.UserRepository;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    // Obtener todos los usuarios
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    // Guardar un usuario nuevo
    public User saveUser(User user) {
        return userRepository.save(user);
    }
}
