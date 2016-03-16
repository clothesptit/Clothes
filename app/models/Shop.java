package models;

import play.db.jpa.GenericModel;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by Ha Thanh Tam on 16/03/2016.
 */
@Entity
@Table(name = "tblShop")
public class Shop extends GenericModel implements Serializable {
    private static final long serialVersionUID = 12L;
    @Id
    public int id;
    @Column(length = 100, nullable = false)
    public String name;
    @Column(length = 100, nullable = false)
    public String email;
    @Column(length = 20, nullable = false)
    public String phone;
    @Column(length = 255, nullable = false)
    public String address;
    @Column(length = 32, nullable = false)
    public String token;
}
