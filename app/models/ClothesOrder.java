package models;

import play.db.jpa.GenericModel;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by Ha Thanh Tam on 16/03/2016.
 */
@Entity
@Table(name = "ClothesOrder")
public class ClothesOrder extends GenericModel implements Serializable {
    private static final long serialVersionUID = 6L;
    @Id
    public int id;
    @Column(nullable = false)
    public int quantity;
    @OneToOne
    @JoinColumn(name = "id_clothes", nullable = false)
    public Clothes clothes;
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "id_bill")
    public Bill bill;

    public ClothesOrder(int quantity, Clothes clothes, Bill bill) {
        this.quantity = quantity;
        this.clothes = clothes;
        this.bill = bill;
    }

    public ClothesOrder() {

    }
}
