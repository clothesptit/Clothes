package models;

import play.db.jpa.GenericModel;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by Ha Thanh Tam on 16/03/2016.
 */
@Entity
@Table(name = "tblOrderPublisher")
public class OrderPublisher extends GenericModel implements Serializable {
    private static final long serialVersionUID = 18L;
    @Id
    public int id;
    @ManyToOne
    @JoinColumn(name = "id_clothes")
    public Clothes clothes;
    @Column(nullable = false)
    public int quantity;
    @ManyToOne
    @JoinColumn(name = "id_cart_publisher")
    public CartPublisher cartPublisher;
}
