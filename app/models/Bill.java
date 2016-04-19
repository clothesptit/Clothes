package models;

import play.db.jpa.GenericModel;

import javax.persistence.*;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
    @Column
    public boolean paymentMethod;
    @ManyToOne
    @JoinColumn(name = "id_address_shipping")
    public AddressShipping addressShipping;
    @ManyToOne
    @JoinColumn(name = "id_customer")
    public Customer customer;
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "bill")
    public List<ClothesOrder> clothesOrderList;
    @Column(name = "status", length = 100)
    public String status;
    public int usePoint;

    public Bill(Date date, boolean paymentMethod, AddressShipping addressShipping, Customer customer, List<ClothesOrder> clothesOrderList) {
        this.date = date;
        this.paymentMethod = paymentMethod;
        this.addressShipping = addressShipping;
        this.customer = customer;
        this.clothesOrderList = clothesOrderList;
    }

    public Bill() {
        clothesOrderList = new ArrayList<ClothesOrder>();
        status = "Đang chờ xác nhận";
    }

    public String displayDate() {
        String pattern = "yyyy-MM-dd hh:mm:ss.S";
        SimpleDateFormat format = new SimpleDateFormat(pattern);
        return format.format(date).toString();
    }
}
