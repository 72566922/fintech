package com.fintech.mujer_fintech.controllers.paymentMethods;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fintech.mujer_fintech.models.entity.PaymentMethod;
import com.fintech.mujer_fintech.models.service.paymentMethods.PaymentMethodsService;

@RestController
@RequestMapping("/api/paymentmethods")
public class PaymentMethodsController {
    
    @Autowired
    private PaymentMethodsService paymentMethodsService;

    @GetMapping
    public List<PaymentMethod> getAllPaymentMethods(){
        return paymentMethodsService.getAllPaymentMethods();
    }
}
