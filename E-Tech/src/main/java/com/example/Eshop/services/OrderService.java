package com.example.Eshop.services;

import com.example.Eshop.entities.Orders;
import java.util.List;

public interface OrderService {

    List<Orders> getAllOrders();
    
    boolean insertOrder(Orders order);

    void deleteOrder(int id);
    
    boolean orderShipped(int id);

}
