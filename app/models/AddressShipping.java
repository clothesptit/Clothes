package models;

import play.db.jpa.GenericModel;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by Ha Thanh Tam on 16/03/2016.
 */
@Entity
@Table(name = "AddressShipping")
public class AddressShipping extends GenericModel implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    public int id;
    @Column(length = 30, nullable = false)
    public String num;
    @Column(length = 50, nullable = false)
    public String ward;
    @Column(length = 50, nullable = false)
    public String district;
    @Column(length = 50, nullable = false)
    public String city;

    public AddressShipping(String num, String ward, String district, String city) {
        this.num = num;
        this.ward = ward;
        this.district = district;
        this.city = city;
    }

    public AddressShipping() {
    }
}
