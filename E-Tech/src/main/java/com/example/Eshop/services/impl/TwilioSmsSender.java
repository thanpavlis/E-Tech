package com.example.Eshop.services.impl;

import com.example.Eshop.models.SmsRequest;
import com.example.Eshop.services.SmsSender;
import com.twilio.exception.ApiException;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.rest.api.v2010.account.MessageCreator;
import com.twilio.type.PhoneNumber;
import org.springframework.stereotype.Service;

@Service
public class TwilioSmsSender implements SmsSender {

    @Override
    public boolean sendSms(SmsRequest smsRequest) {
        try {
            PhoneNumber to = new PhoneNumber(smsRequest.getPhoneNumber());
            PhoneNumber from = new PhoneNumber("E-Tech");
            String message = smsRequest.getMessage();
            MessageCreator creator = Message.creator(to, from, message);
            creator.create();
            return (true);
        } catch (ApiException e) {
            System.out.println("Phone number [" + smsRequest.getPhoneNumber() + "] is not a valid number");
        }
        return (false);
    }

}
