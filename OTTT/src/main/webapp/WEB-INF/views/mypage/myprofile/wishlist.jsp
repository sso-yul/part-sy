<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>찜목록</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="${path}/resources/css/mypage/wishlist.css" >
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>

</head>
<body>
	<div class="wrap">
		<%@ include file="../../fix/header.jsp" %>
	
		<section class="sec01">
			<c:choose>
				<c:when test="${userChk eq true }"><%@ include file="../../fix/mnb.jsp" %></c:when>
				<c:otherwise><%@ include file="../../fix/mnb2.jsp" %></c:otherwise>
			</c:choose>
		</section>
		
		<section class="sec02">
			<%@ include file="../../fix/Lmnb.jsp" %>
	
	        <div class="main">
	        	<section class="sec_2">
	        		<div class="btn_more_div" style="text-align: right; margin-top: 20px; ">
	        			<button type="button" class="btn_more" data-bs-toggle="dropdown" aria-expanded="false" style="background-color: black; color: #fff; width: 50px;">
	        			정렬
	        			</button>
		       			<ul class="dropdown-menu dropdown-menu-dark">
		       				<li><a class="dropdown-item" href="#">최신순</a></li>
		       				<li><a class="dropdown-item" href="#">별점순</a></li>
		   				</ul>
	 				</div>
				</section>
				
				<div class="main-work">					

				</div>
				
				<div class=paging-container>
		    		<div class="paging">		    			
		    				    			
		    		</div>	    	
	    		</div>
				
	        </div>
	        
	        </section>
		</div>
	
	<script type="text/javascript">
		let CATEGORY = '' 
		let USER = '${userDTO.user_nicknm}'
		let PAGE = ${pr.sc.page}
		let PAGESIZE = ${pr.sc.pageSize}
		
		let wishListCnt = ${wishListCnt}
		
				
		$(document).ready(function() {			
			
			fnGetWishList({
				"user" : USER
				, "categoryNo" : CATEGORY
				, "page" : PAGE
				, "pageSize" : PAGESIZE
			})
			
		})
	
		function fnGetWishList(param) {
			
			$.post(
					"/ottt/mypage/getwishlist"
				    ,param
				    ,fnCreatWishList
				)
				
				console.log("param")
				console.log(param)
			
		}
		
		function fnCreatWishList(response) {
			
			console.log("ajax 통신결과");
			console.log(response);
			
			let createHtml = "";
			
			let list = response.list;
			let wishListCnt = response.wishListCnt
			let pr = response.pr
			
			list.forEach(function(v) {
				createHtml += '<div class="work-info">'
				createHtml += '<a href="<c:url value="/detailPage?content_no=' +v.content_no+ '" />">'
				createHtml += '<img src="' +v.thumbnail+ '" class="poster"/></a>'
				createHtml += '<div style="text-align: right; border: #fff;">'
				createHtml += '<input type="checkbox" class="btn-check" id="btncheck1" autocomplete="off" checked>'
				createHtml += '<div class="title" style="text-align: center; font-size: 13px;">'+v.content_nm+'</div>'
				createHtml += '<div class="review"><img src="${path}/resources/images/img/starone.png" class="review-star" alt="star">'+v.rating+'</div>'
				createHtml += '</div>'
				createHtml += '</div>'				
			})
			
			$('.main-work').append(createHtml)
			
			let createPage = "";
			
			 if (response.wishListCnt == null || response.wishListCnt === 0) {
			        createPage += '<div class="title-line" style="text-align: center;">찜목록이 없습니다</div>';
			    } else {
			        createPage += '<div class="page-num" style="margin-top: 10px;">';
			        createPage += '<nav aria-label="Page navigation example" class="d-flex flex-row justify-content-center">';
			        createPage += '<ul class="pagination">';
			        if (response.pr.showPrev) {
			            createPage += '<li class="page-item">';
			            createPage += '<a class="page-link" onclick="javascript:fnPage('+ (response.pr.beginPage-1) +','+response.pr.sc.categoryNo+ ')">&lt;</a></li>';
			        }
			        for (let i = response.pr.beginPage; i <= response.pr.endPage; i++) {
			        	  createPage += '<li class="page-item">';
			        	  if (i === response.pr.sc.page) {
			        	    createPage += '<a class="page-link selpage" onclick="javascript:fnPage('+i+','+response.pr.sc.categoryNo+ ')">' + i + '</a>';
			        	  } else {
			        	    createPage += '<a class="page-link" onclick="javascript:fnPage('+i+','+response.pr.sc.categoryNo+ ')">' + i + '</a>';
			        	  }
			        	  createPage += '</li>';
			        	}
			        if (response.pr.showNext) {
			            createPage += '<li class="page-item">';
			            createPage += '<a class="page-link" onclick="javascript:fnPage('+(response.pr.endPage+1)+','+response.pr.sc.categoryNo+ ')">&gt;</a></li>';
			        }
			        createPage += '</ul></nav></div>';
			    }
			
			$('.paging').append(createPage)

							
		}
		
		function fnCategory(category) {
			$(".main-work").html("");
			$('.paging').html("");
			
			$('.Lmenu a').css("color", "")
			let clickedElement = event.target;
		    $(clickedElement).css("color", "#33ff33");
		    
			fnGetWishList({
				"user" : USER
				, "categoryNo" : category
				, "page" : PAGE
				, "pageSize" : PAGESIZE
			});
			
		}
		
		function fnPage(page, category) {
			$(".main-work").html("");
			$('.paging').html("");
			
			fnGetWishList({
				"user" : USER
				, "categoryNo" : category
				, "page" : page
				, "pageSize" : PAGESIZE
			});
			
		}
		
	</script>		
		
		
	<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
    crossorigin="anonymous"></script>
</body>
</html>