package models;

import play.db.jpa.GenericModel;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by Ha Thanh Tam on 16/03/2016.
 */
@Entity
@Table(name = "tblClothes")
public class Clothes extends GenericModel implements Serializable {
    private static final long serialVersionUID = 1L;
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
    public float salePrice;
    @Column(length = 255)
    public String deal;
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
}
