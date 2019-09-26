package com.hx.rm.entity;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Component;

public class Page<E> implements Serializable {
	private int currentPage;
	private int pageNum;
	private int totalPage;
	private int totalNum;
	private List<E> datas;
	
	public Page() {
	}

	public Page(int currentPage, int pageNum, int totalPage, int totalNum, List<E> datas) {
		this.currentPage = currentPage;
		this.pageNum = pageNum;
		this.totalPage = totalPage;
		this.totalNum = totalNum;
		this.datas = datas;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int toTalPage) {
		this.totalPage = toTalPage;
	}

	public int getTotalNum() {
		return totalNum;
	}

	public void setTotalNum(int toTalNum) {
		this.totalNum = toTalNum;
	}

	public List<E> getDatas() {
		return datas;
	}

	public void setDatas(List<E> datas) {
		this.datas = datas;
	}

	@Override
	public String toString() {
		return "Page [currentPage=" + currentPage + ", pageNum=" + pageNum + ", totalPage=" + totalPage + ", totalNum="
				+ totalNum + ", datas=" + datas + "]";
	}
}
