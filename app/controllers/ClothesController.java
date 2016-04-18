package controllers;

import models.Clothes;
import play.mvc.Controller;

import java.util.List;

/**
 * Created by Phuong on 16/03/2016.
 */
public class ClothesController extends Controller {

    public static void homepage() {
        List<Clothes> clothesList = Clothes.find("FROM Clothes").fetch(8);
        renderArgs.put("clothesList", clothesList);
        render("clothes/homepage.html");
    }

}
