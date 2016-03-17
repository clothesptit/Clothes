package models;

import play.db.jpa.GenericModel;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * Created by Ha Thanh Tam on 16/03/2016.
 */
@Entity
@Table(name = "Bill")
public class Bill extends GenericModel implements Serializable {
    private static final long serialVersionUID = 3L;
    @Id
    public int id;
    @Column(nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    public Date date;
    @Column(nullable = false)
    public boolean paymentMethod;
    @ManyToOne
    @JoinColumn(name = "id_address_shipping")
    public AddressShipping addressShipping;
    @ManyToOne
    @JoinColumn(name = "id_customer")
    public Customer customer;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "bill")
    public List<ClothesOrder> clothesOrderList;

    public Bill(Date date, boolean paymentMethod, AddressShipping addressShipping, Customer customer, List<ClothesOrder> clothesOrderList) {
        this.date = date;
        this.paymentMethod = paymentMethod;
        this.addressShipping = addressShipping;
        this.customer = customer;
        this.clothesOrderList = clothesOrderList;
    }

    public Bill() {

    }
}
