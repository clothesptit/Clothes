package models;

import play.db.jpa.GenericModel;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by Ha Thanh Tam on 17/03/2016.
 */
@Entity
@Table(name = "MembershipType")
public class MembershipType extends GenericModel implements Serializable {
    private static final long serialVersionUID = 10L;
    @Id
    public int id;
    @Column(nullable = false, length = 45)
    public String name;
    public int rate;

    public MembershipType(String name, int rate) {
        this.name = name;
        this.rate = rate;
    }

    public MembershipType() {

    }
}
