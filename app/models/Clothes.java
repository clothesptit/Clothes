package models;

import play.db.jpa.GenericModel;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by Ha Thanh Tam on 16/03/2016.
 */
@Entity
@Table(name = "Clothes")
public class Clothes extends GenericModel implements Serializable {
    private static final long serialVersionUID = 5L;
    @Id
    public int id;
    @Column(length = 30)
    public String title;
    @Column(length = 30)
    public String image;
    @Column(length = 30)
    public String type;
    @Column(length = 30)
    public String size;
    @Column(length = 30)
    public String material;
    @Column(nullable = false)
    public float price;
    @Column(nullable = false)
    public float pricePublisher;
    @Column(nullable = false)
    public int quantity;
    @Column(length = 30)
    public String color;
    @Column(length = 255)
    public String description;
    @ManyToOne
    @JoinColumn(name = "id_publisher")
    public Publisher publisher;
    @ManyToOne
    @JoinColumn(name = "id_deal")
    public Deal deal;

    public Clothes(String title, String image, String type, String size, String material, float price, float pricePublisher, int quantity, String color, String description, Publisher publisher, Deal deal) {
        this.title = title;
        this.image = image;
        this.type = type;
        this.size = size;
        this.material = material;
        this.price = price;
        this.pricePublisher = pricePublisher;
        this.quantity = quantity;
        this.color = color;
        this.description = description;
        this.publisher = publisher;
        this.deal = deal;
    }

    public Clothes() {

    }
}
