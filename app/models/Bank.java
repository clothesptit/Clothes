package models;

import play.db.jpa.GenericModel;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by Ha Thanh Tam on 16/03/2016.
 */
@Entity
@Table(name = "Bank")
public class Bank extends GenericModel implements Serializable {
    private static final long serialVersionUID = 2L;
    @Id
    @Column(name = "id")
    public int id;
    @Column(length = 45, nullable = false)
    public String name;
    @Column(length = 20, nullable = false)
    public String cardNumber;
    @Column(length = 20, nullable = false)
    public String cardType;

    public Bank(String name, String cardNumber, String cardType) {
        this.name = name;
        this.cardNumber = cardNumber;
        this.cardType = cardType;
    }

    public Bank() {
    }
}
