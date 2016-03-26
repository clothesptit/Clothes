package models;

import play.db.jpa.GenericModel;

import javax.persistence.*;

/**
 * Created by Ha Thanh Tam on 25/03/2016.
 */
@Entity
@Table(name = "PublisherService")
public class PublisherService extends GenericModel {
    @Id
    public int id;
    @ManyToOne
    @JoinColumn(name = "id_publisher", nullable = false)
    public Publisher publisher;
    @Column(name = "urlService", nullable = false, length = 255)
    public String urlService;
    @Column(nullable = false, length = 100)
    public String targetNamespace;
    @Column(nullable = false, length = 100)
    public String name;
    @Column(nullable = false, length = 100)
    public String interfaceName;
    @Column(name = "description", nullable = false, length = 500)
    public String description;

    public PublisherService(Publisher publisher, String urlService, String targetNamespace, String name, String description) {
        this.publisher = publisher;
        this.urlService = urlService;
        this.targetNamespace = targetNamespace;
        this.name = name;
        this.description = description;
    }

    public PublisherService() {
    }
}
