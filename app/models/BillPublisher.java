package models;

import play.db.jpa.GenericModel;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;
import java.util.List;

/**
 * Created by Ha Thanh Tam on 16/03/2016.
 */
@Entity
@Table(name = "BillPublisher")
public class BillPublisher extends GenericModel implements Serializable {
    private static final long serialVersionUID = 4L;
    @Id
    public int id;
    @ManyToOne
    @JoinColumn(name = "id_publisher")
    public Publisher publisher;
    @Column(nullable = false)
    public Date date;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "billPublisher")
    public List<OrderPublisher> orderPublishers;

    public BillPublisher(Publisher publisher, Date date, List<OrderPublisher> orderPublishers) {
        this.publisher = publisher;
        this.date = date;
        this.orderPublishers = orderPublishers;
    }

    public BillPublisher() {

    }
}
