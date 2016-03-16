package models;

import play.db.jpa.GenericModel;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;

/**
 * Created by Ha Thanh Tam on 16/03/2016.
 */
@Entity
@Table(name = "tblBill")
public class Bill extends GenericModel implements Serializable {
    private static final long serialVersionUID = 17L;
    @Id
    public int id;
    @ManyToOne
    @JoinColumn(name = "id_cart")
    public Cart cart;
    @Column(nullable = false)
    public Date date;
    @ManyToOne
    @JoinColumn(name = "id_address_shipping")
    public AddressShipping addressShipping;
}
