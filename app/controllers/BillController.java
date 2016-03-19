package controllers;

import models.Bill;
import play.mvc.Controller;

/**
 * Created by Ha Thanh Tam on 19/03/2016.
 */
public class BillController extends Controller {

    public static void billForm() {
    }

    public static void confirmBill() {
        Bill bill = new Bill();
        Mails.sendConfirmOrder(bill);
    }
}
