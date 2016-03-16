package models;

import play.db.jpa.GenericModel;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by Ha Thanh Tam on 16/03/2016.
 */
@Entity
@Table(name = "tblCustomer")
public class Customer extends GenericModel implements Serializable {
    private static final long serialVersionUID = 10L;
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
    @ManyToOne
    @JoinColumn(name = "id_bank")
    public Bank bank;
}
