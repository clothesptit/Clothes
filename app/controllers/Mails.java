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
        bill.customer = new Customer();
        bill.customer.email = "";
        bill.customer.fullName = "Nguyễn Thị Phương";
        bill.customer.phone = "0987654321";
        bill.addressShipping = new AddressShipping("97A", "Mỗ Lao", "Hà Đông", "Hà Nội");
        setSubject("Xác nhận đơn đặt hàng quần áo");
        addRecipient(bill.customer.email);
        setFrom("Website Bán Quần Áo <demoptit@gmail.com>");
        String token = random.randomAlphanumeric(32);
        while (Cache.get(token) != null) {
            token = random.randomAlphanumeric(32);
        }
        String hostName = Play.configuration.getProperty("application.baseUrl");
        String linkConfirm = hostName + "Confirm-order.html?token=" + token;
        bill.date = cal.getTime();
        Clothes clothes = new Clothes();
        clothes.title = "Áo 1";
        clothes.size = "M";
        bill.clothesOrderList = new ArrayList<ClothesOrder>();
        bill.clothesOrderList.add(new ClothesOrder(clothes, 3));
        clothes.title = "Áo 2";
        clothes.size = "L";
        bill.clothesOrderList.add(new ClothesOrder(clothes, 2));
        clothes.title = "Áo 3";
        clothes.size = "XL";
        bill.clothesOrderList.add(new ClothesOrder(clothes, 1));
//        EmailAttachment attachment;
//        for (int i = 0; i < bill.clothesOrderList.size(); i++) {
//            attachment = new EmailAttachment();
//            attachment.setDescription(bill.clothesOrderList.get(i).clothes.title);
//            attachment.setPath(Play.getFile("/public/" + bill.clothesOrderList.get(i).clothes.image).getPath());
//            addAttachment(attachment);
//        }
        Cache.set(token, bill, "24h");
        Cache.set(bill.customer.username, token, "24h");
        send("mails/send.confirm.order", linkConfirm, bill);
    }

    public static void sendStatusOrder(Customer customer, Bill bill) {
        send("mails/send.status.order");
    }

    public static void sendCompletedOrder(Customer customer, Bill bill) {
        send("mails/send.completed.order");
    }

}
