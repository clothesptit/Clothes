package controllers;

import com.clothes1.services.ClothesService1;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import models.Clothes;
import models.Employee;
import models.Publisher;
import models.PublisherService;
import play.cache.Cache;
import play.db.jpa.JPA;
import play.mvc.Before;
import play.mvc.Controller;

import javax.xml.namespace.QName;
import javax.xml.ws.Service;
import java.lang.reflect.Type;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

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

    public static void showListPublisher() {
        List<Publisher> listPublisher = Publisher.findAll();
        renderArgs.put("listPublisher", listPublisher);
        render("admin/show.list.publisher.html");
    }

    public static void showListClothes(int idPublisher) {
        PublisherService publisherService = (PublisherService) JPA.em()
                .createQuery("FROM PublisherService p WHERE p.publisher.id=:id")
                .setParameter("id", idPublisher).getSingleResult();
        try {
            URL url = new URL(publisherService.urlService);
            QName qName = new QName(publisherService.targetNamespace, publisherService.name);
            Service service = Service.create(url, qName);
            if (publisherService.interfaceName.equals("ClothesService1")) {
                ClothesService1 clothesService1 = service.getPort(ClothesService1.class);
                Gson gson = new Gson();
                Type listType = new TypeToken<ArrayList<Clothes>>() {
                }.getType();
                List<Clothes> clothesList = gson.fromJson(clothesService1.findAll(), listType);
                renderJSON(clothesList);
            }
        } catch (MalformedURLException e) {
            e.printStackTrace();
        }
        render("admin/admin.html");
    }
}
