package models;

import play.db.jpa.GenericModel;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;
import java.util.List;

/**
 * Created by Ha Thanh Tam on 16/03/2016.
 */
@Entity
@Table(name = "tblBill")
public class Bill extends GenericModel implements Serializable {
    private static final long serialVersionUID = 17L;
    @Id
    public int id;
    @Column(nullable = false)
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
}
