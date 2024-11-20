package com.fintech.mujer_fintech.controllers.userRoles;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fintech.mujer_fintech.models.entity.User;
import com.fintech.mujer_fintech.models.entity.UserRole;
import com.fintech.mujer_fintech.models.service.userRoles.UserRoleService;
import com.fintech.mujer_fintech.models.service.userRoles.UserService;
import com.fintech.mujer_fintech.configuration.PasswordService;

@RestController
@RequestMapping("/api/usuarios")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired 
    private UserRoleService userRoleService;

    @Autowired
    private PasswordService passwordService;

    // Método GET que ya tienes
    @GetMapping
    public List<User> getAllUsers() {
        return userService.getAllUsers();
    }

    @GetMapping("/rol")
    public List<UserRole> getAllUserRoles(){
        return userRoleService.getAllUserRoles();
    }

    // Nuevo método POST para crear un usuario
    @PostMapping
    public User createUser(@RequestBody User user) {
        // Encriptar la contraseña antes de guardar el usuario
        user.setPassword(passwordService.encryptPassword(user.getPassword()));
        return userService.saveUser(user); // Guardar el usuario en la base de datos
    }
}
