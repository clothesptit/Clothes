package models;

import play.db.jpa.GenericModel;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by Ha Thanh Tam on 16/03/2016.
 */
@Entity
@Table(name = "tblPublisher")
public class Publisher extends GenericModel implements Serializable {
    private static final long serialVersionUID = 3L;
    @Id
    public int id;
    @Column(length = 30)
    public String name;
    @Column(length = 30)
    public String email;
}
