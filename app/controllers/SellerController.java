package controllers;

import models.Employee;
import play.cache.Cache;
import play.mvc.Before;
import play.mvc.Controller;

/**
 * Created by Ha Thanh Tam on 16/03/2016.
 */
public class SellerController extends Controller {
    @Before
    static void checkNotSeller() {
        try {
            int position = ((Employee) Cache.get(session.get("username"))).position;
            if (position != 1) {
                redirect("../../Employee/Login-form.html");
            }
        } catch (Exception e) {
            redirect("../../Employee/Login-form.html");
        }
    }

    public static void seller() {
        render("seller/seller.html");
    }
}
