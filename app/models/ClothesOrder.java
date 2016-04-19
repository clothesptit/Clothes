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
    @ManyToOne
    @JoinColumn(name = "id_clothes", nullable = false)
    public Clothes clothes;
    @Column(nullable = false)
    public int quantity;
    @ManyToOne
    @JoinColumn(name = "id_bill")
    public Bill bill;
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_deal")
    public Deal deal;

    public ClothesOrder(Clothes clothes, int quantity) {
        this.clothes = clothes;
        this.quantity = quantity;
    }

    public ClothesOrder() {
    }
}
