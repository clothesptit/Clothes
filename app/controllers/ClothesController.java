package controllers;

import play.mvc.Controller;

/**
 * Created by Phuong on 16/03/2016.
 */
public class ClothesController extends Controller {

    public static void homepage() {
        render("clothes/homepage.html");
    }

}
