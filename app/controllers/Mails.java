package controllers;

import models.Bill;
import models.Clothes;
import models.ClothesOrder;
import models.Customer;
import org.apache.commons.lang.RandomStringUtils;
import org.apache.commons.mail.EmailAttachment;
import play.Play;
import play.cache.Cache;
import play.mvc.Mailer;

import java.util.ArrayList;

/**
 * Created by Ha Thanh Tam on 19/03/2016.
 */
public class Mails extends Mailer {
    private static RandomStringUtils random = new RandomStringUtils();

    public static void sendConfirmOrder(Bill bill) {
        setSubject("Xác nhận đơn đặt hàng quần áo");
        addRecipient(bill.customer.email);
        setFrom("Support Demo PTIT <demoptit@gmail.com>");
        String token = random.randomAlphanumeric(32);
        while (Cache.get(token) != null) {
            token = random.randomAlphanumeric(32);
        }
        String hostName = Play.configuration.getProperty("application.baseUrl");
        String linkConfirm = hostName + "Confirm-order?token=" + token;
        EmailAttachment attachment;
        for (int i = 0; i < bill.clothesOrderList.size(); i++) {
            attachment = new EmailAttachment();
            attachment.setDescription(bill.clothesOrderList.get(i).clothes.title);
            attachment.setPath(Play.getFile("/public/" + bill.clothesOrderList.get(i).clothes.image).getPath());
            addAttachment(attachment);
        }
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
