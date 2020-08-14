package com.vanda.domain;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "locations")
@XmlAccessorType(XmlAccessType.FIELD)
public class WalksVO {

	@XmlElement(name = "location")
	private List<WalkVO> walks;

	public List<WalkVO> getWalks() {
		return walks;
	}

	public void setWalks(List<WalkVO> walks) {
		this.walks = walks;
	}

}
