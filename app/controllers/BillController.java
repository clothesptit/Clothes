package controllers;

import models.*;
import play.cache.Cache;
import play.mvc.Before;
import play.mvc.Controller;

import java.util.Calendar;
import java.util.List;

/**
 * Created by Ha Thanh Tam on 19/03/2016.
 */
public class BillController extends Controller {
    @Before
    static void checkNotAuthentification() {
        if (Cache.get(session.get("username")) == null) {
            redirect("../../Customer/Login-form.html");
        }
    }

    public static void addToBill(int id, int quantity) {
        Bill bill;
        if (Cache.get("bill" + session.get("username")) != null) {
            bill = (Bill) Cache.get("bill" + session.get("username"));
        } else {
            bill = new Bill();
            Customer customer = (Customer) Cache.get(session.get("Username"));
            bill.customer = customer;
        }
        Clothes clothes = Clothes.findById(id);
        ClothesOrder clothesOrder = new ClothesOrder(clothes, quantity);
        bill.clothesOrderList.add(clothesOrder);
        Cache.set("bill" + session.get("username"), bill);
        redirect("../View-bill.html");
    }

    public static void deleteFromBill(int id) {
        if (Cache.get("bill" + session.get("username")) == null) {
            redirect("../Homepage.html");
        }
        Bill bill = (Bill) Cache.get("bill" + session.get("username"));
        for (int i = 0; i < bill.clothesOrderList.size(); i++) {
            if (bill.clothesOrderList.get(i).clothes.id == id) {
                bill.clothesOrderList.remove(i);
                break;
            }
        }
        if (bill.clothesOrderList.size() == 0) {
            Cache.delete("bill" + session.get("username"));
        } else {
            Cache.set("bill" + session.get("username"), bill);
        }
        redirect("../View-bill.html");
    }

    public static void viewBill() {
        if (Cache.get("bill" + session.get("username")) == null) {
            redirect("../Homepage.html");
        }
        Bill bill = (Bill) Cache.get("bill" + session.get("username"));
        renderArgs.put("bill", bill);
        render("bill/view.bill.html");
    }

    public static void confirmBill(String num, String ward, String district, String city) {
        if (Cache.get("bill" + session.get("username")) == null) {
            redirect("../Homepage.html");
        }
        Bill bill = (Bill) Cache.get("bill" + session.get("username"));
        Calendar cal = Calendar.getInstance();
        bill.date = cal.getTime();
        bill.addressShipping = new AddressShipping(num, ward, district, city);
        Mails.sendConfirmOrder(bill);
        redirect("../View-bill.html");
    }

    public static void viewAllBill() {
        List<Bill> bills = Bill.findAll();
        if (Cache.get("bill" + session.get("username")) != null) {
            bills.add((Bill) Cache.get("bill" + session.get("username")));
        }
        renderArgs.put("bills", bills);
        render("bill/view.all.bill.html");
    }
}
