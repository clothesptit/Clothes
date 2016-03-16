package models;

import play.db.jpa.GenericModel;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;

/**
 * Created by Ha Thanh Tam on 16/03/2016.
 */
@Entity
@Table(name = "tblBillPublisher")
public class BillPublisher extends GenericModel implements Serializable {
    private static final long serialVersionUID = 20L;
    @Id
    public int id;
    @ManyToOne
    @JoinColumn(name = "id_cart_publisher")
    public CartPublisher cartPublisher;
    @Column(nullable = false)
    public Date date;
}
