package models;

import play.db.jpa.GenericModel;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by Ha Thanh Tam on 16/03/2016.
 */
@Entity
@Table(name = "Publisher")
public class Publisher extends GenericModel implements Serializable {
    private static final long serialVersionUID = 12L;
    @Id
    public int id;
    @Column(length = 100)
    public String name;
    @Column(length = 100)
    public String email;
    @Column(length = 20)
    public String phone;
    @Column(length = 255)
    public String address;

    public Publisher(String name, String email, String phone, String address) {
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.address = address;
    }

    public Publisher() {

    }
}
