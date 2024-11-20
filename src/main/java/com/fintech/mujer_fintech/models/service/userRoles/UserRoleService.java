package com.fintech.mujer_fintech.models.service.userRoles;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fintech.mujer_fintech.models.entity.UserRole;
import com.fintech.mujer_fintech.models.repository.UserRoleRepository;


@Service
public class UserRoleService {
    
    @Autowired
    private UserRoleRepository userRoleRepository;

    public List<UserRole> getAllUserRoles(){
        return userRoleRepository.findAll();
    }

    public UserRole saveUserRole(UserRole userRole){
        return userRoleRepository.save(userRole);
    }
}
