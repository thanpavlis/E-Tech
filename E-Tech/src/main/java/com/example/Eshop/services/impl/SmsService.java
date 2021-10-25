package com.example.Eshop.services.impl;

import com.example.Eshop.models.SmsRequest;
import com.example.Eshop.services.SmsSender;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SmsService {

    @Autowired
    private SmsSender smsSender;

    public boolean sendSms(SmsRequest smsRequest) {
        return (smsSender.sendSms(smsRequest));
    }
}
