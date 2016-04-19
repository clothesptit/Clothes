package controllers;

import models.*;
import org.apache.commons.lang.RandomStringUtils;
import org.apache.commons.mail.EmailAttachment;
import play.Play;
import play.cache.Cache;
import play.mvc.Mailer;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by Ha Thanh Tam on 19/03/2016.
 */
public class Mails extends Mailer {
    private static RandomStringUtils random = new RandomStringUtils();
    private static Calendar cal = Calendar.getInstance();

    public static void sendConfirmOrder(Bill bill) {
        setSubject("Xác nhận đơn đặt hàng quần áo.");
        addRecipient(bill.customer.email);
        setFrom("Website Bán Quần Áo <demoptit@gmail.com>");
        String token = random.randomAlphanumeric(32);
        while (Cache.get(token) != null) {
            token = random.randomAlphanumeric(32);
        }
        String hostName = Play.configuration.getProperty("application.baseUrl");
        String linkConfirm = hostName + "Bill/Save-bill.html?token=" + token;
        bill.date = cal.getTime();
        Cache.set(token, bill, "24h");
        send("mails/send.confirm.bill", linkConfirm, bill);
    }

    public static void sendStatusOrder(Bill bill) {
        Customer customer = bill.customer;
        setSubject("Thông tin đơn hàng của bạn.");
        addRecipient(bill.customer.email);
        String hostName = Play.configuration.getProperty("application.baseUrl");
        String linkViewBill = hostName + "Bill/View-bill-by-id.html?id=" + bill.id;
        send("mails/send.status.bill", bill, customer, linkViewBill);
    }

    public static void sendCompletedOrder(Customer customer, Bill bill) {
        send("mails/send.completed.bill");
    }

}
