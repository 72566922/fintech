package com.fintech.mujer_fintech.models.service.paymentMethods;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fintech.mujer_fintech.models.entity.PaymentMethod;
import com.fintech.mujer_fintech.models.repository.PaymentMethodRepository;

@Service
public class PaymentMethodsService {
    
    @Autowired
    private PaymentMethodRepository paymentMethodRepository;

    public List<PaymentMethod> getAllPaymentMethods(){
        return paymentMethodRepository.findAll();
    }
}
