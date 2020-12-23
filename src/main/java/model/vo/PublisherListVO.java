package model.vo;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import java.util.List;

@XmlRootElement(name = "publisherList")
@XmlAccessorType(XmlAccessType.FIELD)
public class PublisherListVO {
    @XmlElement(name = "publisher")
    private List<PublisherVO> publisherList;

    public List<PublisherVO> getPublisherList() {
        return publisherList;
    }

    public void setPublisherList(List<PublisherVO> publisherList) {
        this.publisherList = publisherList;
    }
}
