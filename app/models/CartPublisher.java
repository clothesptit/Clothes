package models;

import play.db.jpa.GenericModel;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

/**
 * Created by Ha Thanh Tam on 16/03/2016.
 */
@Entity
@Table(name = "tblCartPublisher")
public class CartPublisher extends GenericModel implements Serializable {
    private static final long serialVersionUID = 19L;
    @Id
    public int id;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "cartPublisher")
    public List<OrderPublisher> orderPublishers;
    @ManyToOne
    @JoinColumn(name = "id_publisher")
    public Publisher publisher;
}
