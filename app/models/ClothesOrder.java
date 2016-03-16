package models;

import play.db.jpa.GenericModel;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by Ha Thanh Tam on 16/03/2016.
 */
@Entity
@Table(name = "tblClothesOrder")
public class ClothesOrder extends GenericModel implements Serializable {
    private static final long serialVersionUID = 15L;
    @Id
    public int id;
    @Column(nullable = false)
    public int quantity;
    @OneToOne
    @JoinColumn(name = "idBook", nullable = false)
    public Clothes clothes;
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "id_cart")
    public Cart cart;
}
