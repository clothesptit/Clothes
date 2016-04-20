package controllers;

import models.*;
import play.cache.Cache;
import play.mvc.Before;
import play.mvc.Controller;

import java.util.Calendar;
import java.util.List;

/**
 * Created by Phuong on 16/03/2016.
 */
public class ClothesController extends Controller {

    public static void homepage() {
        List<Clothes> clothesList = Clothes.findAll();
        renderArgs.put("clothesList", clothesList);
        render("clothes/homepage.html");
    }

    public static void viewClothes(int id) {
        Clothes clothes = Clothes.findById(id);
        renderArgs.put("clothes", clothes);
        render("clothes/view.clothes.html");
    }

    public static void searchClothes(String txtSearch) {
        List<Clothes> clothesList = Clothes.find("FROM Clothes c WHERE c.title LIKE :txtSearch")
                .setParameter("txtSearch", "%" + txtSearch + "%").fetch();
        renderArgs.put("clothesList", clothesList);
        render("clothes/homepage.html");
    }
}
