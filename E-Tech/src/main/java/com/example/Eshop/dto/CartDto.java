package com.example.Eshop.dto;

import com.example.Eshop.entities.Product;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class CartDto {

    private double totalAmount;//teliko poso plirwmhs proiontwn
    private List<CartProductDto> products;//products

    public CartDto() {
        products = new ArrayList<>();
        totalAmount = 0;
    }

    public boolean addToCart(CartProductDto p) {//prosthiki product sto kalathi    
        for (CartProductDto product : products) {
            if (product.getId() == p.getId()) {//brethike hdh
                return (false);
            }
        }
        products.add(p);
        calcTotalAmount();//ypologismos kostous proiontwn pou einai sto kalathi
        return (true);
    }

    public void calcTotalAmount() {//poso kostizoun ta proionta pou exw sto kalathi 
        double sum = 0;
        for (CartProductDto product : products) {
            sum += product.getTotal();
        }
        totalAmount = sum;
    }

    public int getNumberOfProducts() {//epistrefei ton arithmo twn proiontwn sto kalathi
        return (products.size());
    }

    public List<CartProductDto> getProducts() {
        return (products);
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public List<Integer> getProductsIds() {
        List<Integer> ids = new ArrayList<>();
        for (CartProductDto product : products) {
            ids.add(product.getId());
        }
        return (ids);
    }

    public boolean clearCart() {
        products.clear();
        calcTotalAmount();
        return (true);
    }

    public int deleteProduct(int id) {
        int index = -1;
        for (int i = 0; i < products.size(); i++) {
            if (products.get(i).getId() == id) {
                index = i;
                break;
            }
        }
        products.remove(index);//afairw to product apo thn lista
        calcTotalAmount();
        return (getNumberOfProducts());
    }

    public boolean updateQuantity(int id, int quantity) {
        int index = -1;
        for (int i = 0; i < products.size(); i++) {
            if (products.get(i).getId() == id) {
                index = i;
                break;
            }
        }
        products.get(index).setQuantity(quantity);//auxanw to quantity kata ena
        products.get(index).calcTotal();//xanaypologizw to total price tou proiontos
        calcTotalAmount();//xanaypologizw to totalAmount  
        return (true);
    }

    public HashMap<String, Object> checkProductsWithStock(HashMap<Integer, Product> productsDB) {
        HashMap<String, Object> hmap = new HashMap<>();
        List<Object> updateProducts = new ArrayList<>();
        for (CartProductDto cartProduct : products) {
            if ((productsDB.get(cartProduct.getId()).getStock() == 0) || (cartProduct.getQuantity() > productsDB.get(cartProduct.getId()).getStock())) {//an to stock einai mhdeniko h' mikrotero apo to zhtoumeno   
                cartProduct.setQuantity(productsDB.get(cartProduct.getId()).getStock());
                cartProduct.setStock(productsDB.get(cartProduct.getId()).getStock());
                cartProduct.calcTotal();
                updateProducts.add(cartProduct);
            }
        }
        calcTotalAmount();
        hmap.put("updateProducts", updateProducts);
        hmap.put("totalAmount", totalAmount);
        return (hmap);
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Cart{products=").append(products);
        sb.append(", totalAmount=").append(totalAmount);
        sb.append('}');
        return sb.toString();
    }

}
