package com.clothes2.services;

import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;

/**
 * Created by Ha Thanh Tam on 26/03/2016.
 */
@WebService(serviceName = "ClothesService2", targetNamespace = "com.clothes2")
@SOAPBinding(style = SOAPBinding.Style.RPC)
public interface ClothesService2 {

    public String findAll();

    public String findClothesByType(String type);

    public boolean checkQuantityClothes(int id, String token);

    public void createOrder(String jsonId, String token, String  jsonQuantity);
}
