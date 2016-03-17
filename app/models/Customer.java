package models;

import play.db.jpa.GenericModel;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by Ha Thanh Tam on 16/03/2016.
 */
@Entity
@Table(name = "Customer")
public class Customer extends GenericModel implements Serializable {
    private static final long serialVersionUID = 7L;
    @Id
    @Column(name = "id")
    public int id;
    @Column(length = 45, nullable = false)
    public String username;
    @Column(length = 45, nullable = false)
    public String pwd;
    @Column(length = 100, nullable = false)
    public String email;
    @Column(length = 20)
    public String phone;
    @Column(length = 255)
    public String address;
    public int point;
    @ManyToOne
    @JoinColumn(name = "id_bank")
    public Bank bank;

    public Customer(String username, String pwd, String email, String phone, String address, int point, Bank bank) {
        this.username = username;
        this.pwd = pwd;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.point = point;
        this.bank = bank;
    }

    public Customer() {

    }
}
