package com.clothes1.services;

import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;

/**
 * Created by Ha Thanh Tam on 26/03/2016.
 */
@WebService(serviceName = "ClothesService1", targetNamespace = "com.clothes1")
@SOAPBinding(style = SOAPBinding.Style.RPC)
public interface ClothesService1 {

    public String findAll();

    public String findClothesByType(String type);

    public boolean checkQuantityClothes(int id, String token);

    public void createOrder(String jsonId, String token, String jsonQuantity);
}
