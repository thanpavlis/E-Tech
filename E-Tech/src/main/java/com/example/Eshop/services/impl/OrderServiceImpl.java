package com.example.Eshop.services.impl;

import com.example.Eshop.entities.Orders;
import com.example.Eshop.repositories.OrderRepository;
import com.example.Eshop.services.OrderService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderRepository orderRepo;

    @Override
    public boolean insertOrder(Orders order) {
        return (orderRepo.save(order).getPdfurl().isEmpty());
    }
    
    @Override
    public List<Orders> getAllOrders() {
        return  orderRepo.findAll();
    }

    @Override
    public void deleteOrder(int id) {
        orderRepo.deleteById(id);
    }
    
    @Override
    public boolean orderShipped(int id) {
        try {
            Orders order = orderRepo.getById(id);
            order.setShipped(true);
            orderRepo.saveAndFlush(order);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

}
