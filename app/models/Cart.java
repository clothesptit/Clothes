package models;

import play.db.jpa.GenericModel;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

/**
 * Created by Ha Thanh Tam on 16/03/2016.
 */
@Entity
@Table(name = "tblCart")
public class Cart extends GenericModel implements Serializable {
    private static final long serialVersionUID = 14L;
    @Id
    public int id;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "cart")
    public List<ClothesOrder> clothesOrderList;
    @ManyToOne
    @JoinColumn(name = "id_customer")
    public Customer customer;
}
