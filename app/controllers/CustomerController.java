package controllers;

import play.mvc.Controller;

/**
 * Created by Phuong on 16/03/2016.
 */
public class CustomerController extends Controller {

    public static void registerForm(){
        render("customer/register.form.html");
    }

    public static void viewInfo(){
        render("customer/view.info.html");
    }

}
