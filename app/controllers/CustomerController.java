package controllers;

import models.Bank;
import models.Customer;
import play.cache.Cache;
import play.data.validation.Validation;
import play.db.jpa.JPA;
import play.mvc.Before;
import play.mvc.Controller;

/**
 * Created by Phuong on 16/03/2016.
 */
public class CustomerController extends Controller {
    @Before(unless = {"registerForm", "register"})
    static void checkNotAuthentification() {
        if (Cache.get(session.get("username")) == null) {
            redirect("../Login-form.html");
        }
    }

    @Before(only = {"loginForm", "login"})
    static void checkAuthentification() {
        Customer customer = (Customer) Cache.get(session.get("username"));
        if (customer != null) {
            redirect("../View-info.html");
        }
    }

    public static void loginForm() {
        if (session.get("noti") != null) {
            renderArgs.put("noti", session.get("noti"));
            session.remove("noti");
        }
        render("customer/login.form.html");
    }

    public static void login(String username, String pwd) {
        try {
            Customer customer = (Customer) Customer.find("FROM Customer cus " +
                    "WHERE cus.username = :username " +
                    "AND cus.pwd = :pwd").bind("username", username)
                    .bind("pwd", pwd).fetch().get(0);
            Cache.add(username, customer);
            session.put("username", username);
            redirect("../View-info.html");
        } catch (IndexOutOfBoundsException e) {
            session.put("noti", "UsernameAndPassword");
            redirect("../Login-form.html");
        }
    }


    public static void registerForm() {
        if (session.get("noti") != null) {
            renderArgs.put("noti", session.get("noti"));
            session.remove("noti");
        }
        render("customer/register.form.html");
    }

    public synchronized static void register(String username, String pwd, String email,
                                             String phone, String address, String name,
                                             String cardNumber, String cardType) {
        Validation.ValidationResult result = validation.email(email);
        if (!result.ok) {
            session.put("noti", "EmailNotRequired");
            redirect("../Register-form.html");
        }
        if (Customer.find("byUsername", username).fetch().size() != 0) {
            session.put("noti", "UsernameExist");
            redirect("../Register-form.html");
        }
        Bank bank = new Bank();
        int idBank = 0;
        try {
            idBank = (int) JPA.em().createQuery("SELECT MAX(bank.id) FROM Bank bank").getSingleResult() + 1;
        } catch (NullPointerException e) {
        }
        bank.id = idBank;
        bank.name = name;
        bank.cardNumber = cardNumber;
        bank.cardType = cardType;
        Customer customer = new Customer();
        int idCustomer = 0;
        try {
            idCustomer = (int) JPA.em().createQuery("SELECT MAX(cus.id) " +
                    "FROM Customer cus").getSingleResult() + 1;
        } catch (NullPointerException e) {
        }
        customer.id = idCustomer;
        customer.username = username;
        customer.pwd = pwd;
        customer.email = email;
        customer.phone = phone;
        customer.address = address;
        customer.bank = bank;
        bank.save();
        customer.save();
        Cache.add(username, customer);
        session.put("username", username);
        redirect("../View-info.html");
    }

    public static void viewInfo() {
        renderArgs.put("customer", (Customer) Cache.get(session.get("username")));
        render("customer/view.info.html");
    }
}
