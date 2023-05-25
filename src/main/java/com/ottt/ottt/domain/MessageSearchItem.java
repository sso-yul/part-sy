package com.ottt.ottt.domain;

import static java.util.Objects.requireNonNullElse;

import org.springframework.web.util.UriComponentsBuilder;

import static java.lang.Math.*;

public class MessageSearchItem {
	
	//상수로 정의
	//기본, 최소, 최대 게시물 개수
	public static final int DEFAULT_PAGE_SIZE = 20;
	public static final int MIN_PAGE_SIZE = 5;
	public static final int MAX_PAGE_SIZE = 30;
	
	//키워드나 옵션이 없을 경우 전체 게시물 긁어옴
	private Integer page = 1;
	private Integer pageSize = DEFAULT_PAGE_SIZE;
	private String keyword = "";
	private String option = "";
	
	public MessageSearchItem() {};

	public MessageSearchItem(Integer page, Integer pageSize, String option, String keyword) {
		this.page = page;
		this.pageSize = pageSize;
		this.option = option;
		this.keyword = keyword;
	}

	//page와 pageSize는 늘 존재해야 하고, keyword와 option은 없는 것이 기본
	public MessageSearchItem(Integer page, Integer pageSize) {
		this(page, pageSize, "", "");
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		//pageSize가 null일 때 기본값 반환
		this.pageSize = requireNonNullElse(pageSize, DEFAULT_PAGE_SIZE);
		
		//페이지에 딱 진입했을 때 게시물 개수가 최소 보다 크거나 같고, 최대보다 작을 땐 현재 게시물 개수 적용함
		this.pageSize = max(MIN_PAGE_SIZE, min(pageSize, MAX_PAGE_SIZE));
	}

	//특정 페이지를 넘김
	public String getQueryString() {
		return getQueryString(page);
	}
	
	//?page=n&pageSize=nn&option=옵션&keyword=작성자/내용
	public String getQueryString(Integer page) {
		//쿼리스트링 정보 생성해서 넘기기
		return UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("pageSize", pageSize)
				.queryParam("option", option)
				.queryParam("keyword", keyword)
				.build().toString();
	}
	
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}
	
	public Integer getOffset() {
		int result = (page - 1) * pageSize;
		if(result < 0) {
			result = 0;
		}
		return result;
	}
	
	
	
}