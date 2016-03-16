package models;

import play.db.jpa.GenericModel;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by Ha Thanh Tam on 16/03/2016.
 */
@Entity
@Table(name = "tblEmployee")
public class Employee extends GenericModel implements Serializable {
    private static final long serialVersionUID = 13L;
    @Id
    public int id;
    @Column(length = 45, nullable = false)
    public String username;
    @Column(length = 45, nullable = false)
    public String pwd;
    public int position;
    @Column(length = 100, nullable = false)
    public String email;
    @Column(length = 20, nullable = false)
    public String phone;
    @Column(length = 20, nullable = false)
    public String cmnd;
    @Column(length = 255, nullable = false)
    public String address;
    @ManyToOne
    @JoinColumn(name = "id_bank")
    public Bank bank;
}
