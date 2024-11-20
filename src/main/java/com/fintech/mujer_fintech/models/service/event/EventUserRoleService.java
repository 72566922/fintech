package com.fintech.mujer_fintech.models.service.event;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fintech.mujer_fintech.models.entity.EventUserRole;
import com.fintech.mujer_fintech.models.repository.EventUserRoleRepository;

@Service
public class EventUserRoleService {
    
    @Autowired
    private EventUserRoleRepository eventUserRoleRepository;

    public List<EventUserRole> getAllEventUserRoleRepositories(){
        return eventUserRoleRepository.findAll();
    }
}
