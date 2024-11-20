package com.fintech.mujer_fintech.models.service.event;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fintech.mujer_fintech.models.entity.TypeEvent;
import com.fintech.mujer_fintech.models.repository.TypeEventRepository;

@Service
public class TypeEventService {
    
    @Autowired
    private TypeEventRepository typeEventRepository;

    public List<TypeEvent> getAllTypeEvents(){
        return typeEventRepository.findAll();
    }
}
