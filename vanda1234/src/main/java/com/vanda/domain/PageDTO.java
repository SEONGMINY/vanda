package com.vanda.domain;

import com.vanda.common.Criteria;

public class PageDTO {
	private int startPage;
	private int endPage;
	private boolean prev, next;
	private int total;
	private Criteria crt;
	
	public PageDTO(Criteria crt, int total) {
		this.crt = crt;
		this.total = total;
		
		// # of page links is 10
		this.endPage = (int)(Math.ceil(crt.getPageNum()/10.0)) * 10;
		this.startPage = this.endPage - 9;
		
		int realEnd = (int)(Math.ceil((total*1.0)/crt.getAmount()));
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
			System.out.println("total : " + total);
			System.out.println("crt.getAmount() : " + crt.getAmount());
			System.out.println("realEnd : " + realEnd);
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
	
	public String toString() {
		return crt + "startPage["+startPage+"] endPage["+endPage+"] prev["+prev+"] enxt["+next+"]";
	}
	
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public Criteria getCrt() {
		return crt;
	}
	public void setCrt(Criteria crt) {
		this.crt = crt;
	}
}
