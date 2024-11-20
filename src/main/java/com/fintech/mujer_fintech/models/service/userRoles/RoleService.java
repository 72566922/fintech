package com.fintech.mujer_fintech.models.service.userRoles;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fintech.mujer_fintech.models.entity.Role;
import com.fintech.mujer_fintech.models.repository.RoleRepository;

@Service
public class RoleService {
    
    @Autowired
    private RoleRepository roleRepository;

    public List<Role> getAllRoles(){
        return roleRepository.findAll();
    }


    public Role saveRole(Role role){
        return roleRepository.save(role);
    }
}
