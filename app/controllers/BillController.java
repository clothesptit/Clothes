package controllers;

import models.*;
import play.cache.Cache;
import play.db.jpa.JPA;
import play.mvc.Before;
import play.mvc.Controller;

import java.util.Calendar;
import java.util.List;

/**
 * Created by Ha Thanh Tam on 19/03/2016.
 */
public class BillController extends Controller {
    @Before(unless = {"saveBill"})
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
            redirect("../../Clothes/Homepage.html");
        }
        Bill bill = (Bill) Cache.get("bill" + session.get("username"));
        renderArgs.put("bill", bill);
        renderArgs.put("customer", (Customer) Cache.get(session.get("username")));
        render("bill/view.bill.html");
    }

    public static void viewBillById(int id) {
        if (id == 0) {
            redirect("../View-bill.html");
        }
        Bill bill = Bill.findById(id);
        Customer customer = (Customer) Cache.get(session.get("username"));
        if (customer.id != bill.customer.id) {
            redirect("../../Clothes/Homepage.html");
        }
        renderArgs.put("bill", bill);
        render("bill/view.bill.by.id.html");
    }

    public static void confirmBill(int usePoint, String num, String ward, String district, String city) {
        if (Cache.get("bill" + session.get("username")) == null) {
            redirect("../Homepage.html");
        }
        Bill bill = (Bill) Cache.get("bill" + session.get("username"));
        Calendar cal = Calendar.getInstance();
        bill.customer = (Customer) Cache.get(session.get("username"));
        bill.addressShipping = new AddressShipping(num, ward, district, city);
        bill.usePoint = usePoint;
        bill.status = "Đơn hàng đang chờ xác nhận";
        Mails.sendConfirmOrder(bill);
    }

    public synchronized static void saveBill(String token) {
        Bill bill = (Bill) Cache.get(token);
        if (bill == null) {
            redirect("../../Clothes/Homepage.html");
        }
        Customer customer = bill.customer;
        if (customer.point < bill.usePoint) {
            redirect("../../Clothes/Homepage.html");
        }
        customer.point = customer.point - bill.usePoint;
        customer.save();
        int idAddressShipping = 0;
        try {
            idAddressShipping = (Integer) JPA.em().createQuery("SELECT MAX(a.id) FROM AddressShipping a")
                    .getSingleResult() + 1;
        } catch (NullPointerException e) {
        }
        AddressShipping addressShipping = bill.addressShipping;
        addressShipping.id = idAddressShipping;
        addressShipping.save();
        bill.addressShipping = addressShipping;
        int idBill = 1;
        try {
            idBill = (Integer) JPA.em().createQuery("SELECT MAX(b.id) FROM Bill b")
                    .getSingleResult() + 1;
        } catch (NullPointerException e) {
        }
        bill.id = idBill;
        bill.addressShipping.save();
        bill.status = "Đơn hàng đã được xác nhận";
        bill.save();
        Deal deal;
        int idDeal = 0;
        try {
            idDeal = (Integer) JPA.em().createQuery("SELECT MAX(d.id) FROM Deal d").getSingleResult() + 1;
        } catch (NullPointerException e) {
        }
        for (int i = 0; i < bill.clothesOrderList.size(); i++) {
            deal = bill.clothesOrderList.get(i).clothes.deal;
            deal.id = idDeal + i;
            bill.clothesOrderList.get(i).deal = deal;
            bill.clothesOrderList.get(i).bill = bill;
            deal.save();
            bill.clothesOrderList.get(i).save();
        }
        Cache.delete(token);
        Cache.delete("bill" + session.get("username"));
        Mails.sendStatusOrder(bill);
        redirect("../View-bill.html?id=" + idBill);
    }

    public static void viewAllBill() {
        Customer customer = (Customer) Cache.get(session.get("username"));
        List<Bill> bills = Bill.find("FROM Bill b WHERE b.customer.id=:id")
                .setParameter("id", customer.id).fetch();
        if (Cache.get("bill" + session.get("username")) != null) {
            Bill bill = (Bill) Cache.get("bill" + session.get("username"));
            bill.id = 0;
            bills.add(bill);
        }
        renderArgs.put("bills", bills);
        render("bill/view.all.bill.html");
    }
}
