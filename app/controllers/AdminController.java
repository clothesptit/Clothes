package controllers;

import models.Employee;
import play.cache.Cache;
import play.mvc.Before;
import play.mvc.Controller;

/**
 * Created by Ha Thanh Tam on 16/03/2016.
 */
public class AdminController extends Controller {
    @Before
    static void checkNotAdmin() {
        try {
            int position = ((Employee) Cache.get(session.get("username"))).position;
            if (position != 2) {
                redirect("../../Employee/Login-form.html");
            }
        } catch (Exception e) {
            redirect("../../Employee/Login-form.html");
        }
    }

    public static void admin() {
        render("admin/admin.html");
    }
}
