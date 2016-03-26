package models;

import play.db.jpa.GenericModel;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by Ha Thanh Tam on 16/03/2016.
 */
@Entity
@Table(name = "OrderPublisher")
public class OrderPublisher extends GenericModel implements Serializable {
    private static final long serialVersionUID = 11L;
    @Id
    public int id;
    @ManyToOne
    @JoinColumn(name = "id_clothes")
    public Clothes clothes;
    @Column(nullable = false)
    public int quantity;
    @ManyToOne
    @JoinColumn(name = "id_bill_publisher")
    public BillPublisher billPublisher;
    @ManyToOne
    @JoinColumn(name = "id_deal")
    public Deal deal;

    public OrderPublisher(Clothes clothes, int quantity, BillPublisher billPublisher, Deal deal) {
        this.clothes = clothes;
        this.quantity = quantity;
        this.billPublisher = billPublisher;
        this.deal = deal;
    }

    public OrderPublisher() {
    }
}
