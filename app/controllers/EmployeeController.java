package controllers;

import models.Employee;
import play.cache.Cache;
import play.mvc.Before;
import play.mvc.Controller;

/**
 * Created by Ha Thanh Tam on 16/03/2016.
 */
public class EmployeeController extends Controller {
    @Before(unless = {"loginForm", "login"})
    static void checkNotAuthentification() {
        if (Cache.get(session.get("username")) == null) {
            redirect("../Login-form.html");
        }
    }

    @Before(only = {"loginForm", "login"})
    static void checkAuthentification() {
        Employee employee = (Employee) Cache.get(session.get("username"));
        if (employee != null) {
            redirectAuthentification(employee);
        }
    }

    private static void redirectAuthentification(Employee employee) {
        switch (employee.position) {
            case 1:
                redirect("../../Seller/Seller.html");
                break;
            case 2:
                redirect("../../Admin/Admin.html");
                break;
            default:
                Cache.delete(session.get("username"));
                session.remove("username");
                redirect("../Login-form.html");
        }
    }

    public static void loginForm() {
        render("/employee/login.form.html");
    }

    public static void login(String username, String pwd) {
        Employee employee = (Employee) Employee.find("FROM Employee e WHERE " +
                "e.username=:username AND e.pwd=:pwd")
                .bind("username", username).bind("pwd", pwd)
                .fetch().get(0);
        if (employee != null) {
            Cache.set(username, employee);
            session.put("username", username);
            redirectAuthentification(employee);
        }
        redirect("../Login-form.html");
    }
}
