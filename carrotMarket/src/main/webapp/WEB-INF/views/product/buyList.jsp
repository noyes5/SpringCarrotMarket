<%@page import="com.market.carrot.dto.UserDTO"%>
<%@page import="com.market.carrot.dto.FileDTO"%>
<%@page import="com.market.carrot.dto.MyPageBuyDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../common/header.jsp"></jsp:include>
<link href="/carrot/common/css/style_mypage_product.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
	List<MyPageBuyDTO> buyproductlist = (List<MyPageBuyDTO>) request.getAttribute("buyproductlist");
	List<FileDTO> file = (List<FileDTO>) request.getAttribute("file");
	UserDTO user = (UserDTO) session.getAttribute("userdata");
	%>
	<div class="content">
		<div class="media">
			<div class="media-head">
				<%-- <img src="<%=file.get(0).getStoreFilename()+file.get(0).getOriginalFilename()%>"> --%>
				<img
							src="https://d1unjqcospf8gs.cloudfront.net/assets/users/default_profile_80-c649f052a34ebc4eee35048815d8e4f73061bf74552558bb70e07133f25524f9.png"
							alt=""
							onerror="this.onerror=null; this.src='https://d1unjqcospf8gs.cloudfront.net/assets/users/default_profile_80-c649f052a34ebc4eee35048815d8e4f73061bf74552558bb70e07133f25524f9.png';" />
			</div>
			<div class="media-body">
				<h2><%=user.getNickname() %>님 구매내역</h2>
			</div>
		</div>
		<div class="container">
			<div class="bbs-top-search">
				<div class="select">
					<select name="category" class="pl">
						<option value="0" selected>카테고리</option>
						<option value="가전제품">가전제품</option>
						<option value="생활용품">생활용품</option>
						<option value="디지털용품">디지털용품</option>
						<option value="의류">의류</option>
					</select>
				</div>
				<div class="select">
					<select name="status" class="pl">
						<option value="상품상태" selected>상품상태</option>
						<option value="판매중">판매중</option>
						<option value="예약중">예약중</option>
						<option value="판매완료">판매완료</option>
					</select>
				</div>
				<div class="search">
					<input type="text" placeholder="Searah.." class="ser-txt">
					<input type="submit" value="검색" class="btn-ser">
				</div>
			</div>
			<table class="list-typeA">
				<thead>
					<tr>
						<th>상품번호</th>
						<th>제목</th>
						<th>카테고리</th>
						<th>구매일시</th>
						<th>이미지</th>
					</tr>
				</thead>
				<tbody>
					<% 
						int size = buyproductlist.size();
						for(int i=0; i<size; i++){
							MyPageBuyDTO buy = buyproductlist.get(i);
					%>
					<tr>
						<td class="col_blue"><%= buy.getItems_id() %></td>
						<td class="subject"><a href="#"><%= buy.getTitle() %></a></td>
						<td><%= buy.getCategory() %></td>
						<td><%= buy.getRegisterd_at() %></td>
						<td>
							<div class="product-img">
								<img alt="" src="<%=file.get(0).getStoreFilename()+file.get(0).getOriginalFilename()%>">
							</div>
						</td>
					</tr>
					<%} %>
				</tbody>
			</table>
		</div>
	</div>
</body>
<jsp:include page="../common/footer.jsp"></jsp:include>
</html>