package models;

import play.db.jpa.GenericModel;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by Ha Thanh Tam on 17/03/2016.
 */
@Entity
@Table(name = "Deal")
public class Deal extends GenericModel implements Serializable {
    private static final long serialVersionUID = 8L;
    @Id
    public int id;
    public int sale;
    public float voucher;
    @Temporal(TemporalType.TIMESTAMP)
    public Date timeStart;
    @Temporal(TemporalType.TIMESTAMP)
    public Date timeStop;

    public Deal(int sale, float voucher, Date timeStart, Date timeStop) {
        this.sale = sale;
        this.voucher = voucher;
        this.timeStart = timeStart;
        this.timeStop = timeStop;
    }

    public Deal() {

    }
}
