package com.example.Eshop.services;

import com.example.Eshop.models.SmsRequest;

public interface SmsSender {

    boolean sendSms(SmsRequest smsRequest);
}
