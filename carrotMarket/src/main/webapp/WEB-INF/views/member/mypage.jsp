<%@page import="com.market.carrot.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<jsp:include page="../common/header.jsp"></jsp:include>
<title>프로필 수정</title>

<link rel="stylesheet" href="/carrot/common/css/style_signUpForm.css">
<style type="text/css">
.container {
	display: inline-flex;
	margin-top: 50px;
	position: absolute;
	left: 10%;
	transform: transitionX(-10%);
}

#profile_side {
	text-align: center;
}

.profile-user {
	width: 150px;
	height: 150px;
	border-radius: 70%;
	overflow: hidden;
	margin-left: 15%;
	margin-bottom: 10%;
}

.profile-user-img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}
</style>
</head>
<body>
	<%
	UserDTO user = (UserDTO) session.getAttribute("userdata");
	%>
	<div class="container">
		<div class="card border-dark mb-3" id="profile_side"
			style="max-width: 18rem; height: 100%;">
			<div class="card-header">
				<h5 class="card-title">프로필</h5>
			</div>
			<div class="card-body text-dark">

				<div class="profile-user">
					<img alt="profile_img" src="../images/myprofile.jpg"
						class="profile-user-img">
				</div>
				<!-- 아이디 -->
				<div id="id">
					<h5><%=user.getUser_id()%></h5>
				</div>
				<hr />
				<!-- 닉네임 -->
				<div class="input-group  input-group-sm mb-3">
					<input type="text" readonly class="form-control-plaintext"
						id="staticEmail" value="닉네임">
					<div class="input-group-append">
						<button type="button" class="btn btn-warning btn-sm"
							data-toggle="modal" data-target="#nicknameModal">수정</button>
					</div>
				</div>
				<!-- 비밀번호 -->
				<div class="input-group  input-group-sm mb-3">
					<input type="text" readonly class="form-control-plaintext"
						id="staticEmail" value="비밀번호">
					<div class="input-group-append">
						<button type="button" class="btn btn-warning btn-sm"
							data-toggle="modal" data-target="#passModal">수정</button>
					</div>
				</div>
				<!-- 전화번호 -->
				<div class="input-group  input-group-sm mb-3">
					<input type="text" readonly class="form-control-plaintext"
						id="staticEmail" value="전화번호">
					<div class="input-group-append">
						<button type="button" class="btn btn-warning btn-sm"
							data-toggle="modal" data-target="#phoneModal">수정</button>
					</div>
				</div>
				<!-- 이메일 -->
				<div class="input-group  input-group-sm mb-3">
					<input type="text" readonly class="form-control-plaintext"
						id="staticEmail" value="이메일">
					<div class="input-group-append">
						<button type="button" class="btn btn-warning btn-sm"
							data-toggle="modal" data-target="#emailModal">수정</button>
					</div>
				</div>

				<!-- 주소 -->
				<div class="input-group  input-group-sm mb-3">
					<input type="text" readonly class="form-control-plaintext"
						id="staticEmail" value="주소">
					<div class="input-group-append">
						<button type="button" class="btn btn-warning btn-sm"
							data-toggle="modal" data-target="#addrModal">수정</button>
					</div>
				</div>
			</div>
		</div>
		<div class="card border-dark mb-3 w-75" id="profile_main";">
			<div class="card-header">
				<h5 class="card-title">나의 거래</h5>
			</div>
			<div class="card-body text-dark">
				<div>
					<h4><a href="/carrot/mypage/interestproductlist">관심목록</a></h4>
				</div>
				<div>
					<h4><a href="/carrot/mypage/sellproductlist">판매내역</h4>
				</div>
				<div>
					<h4><a href="/carrot/mypage/buyproductlist">구매내역</h4>
				</div>
			</div>
			<div class="card-header ">
				<h5 class="card-title">기타</h5>
			</div>
			<div class="card-body text-dark ">
				<div>
					<h4>채팅</h4>
				</div>
				<div>
					<h4>
						<a href="javascript:clkBtn()" id="delete">회원탈퇴</a>
					</h4>
				</div>
			</div>
		</div>
	</div>

	<!-- 모달창: 닉네임 -->
	<div class="modal fade" id="nicknameModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">닉네임 변경</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="/carrot/member/update.nick">
					<div class="modal-body">
						<div class="form-group">
							<input type="hidden" name='id' value="<%=user.getUser_id()%>">
							<label for="old" class="col-form-label">기존 닉네임</label>
							<div class="form-control"><%=user.getNickname()%></div>
						</div>
						<div class="form-group">
							<label for="new-name" class="col-form-label">새로운 닉네임</label> <input
								type="text" class="form-control" id="recipient-name" name="nick">
						</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<button type="submit" class="btn btn-warning"
						onclick="alert('변경이 완료되었습니다.')">변경하기</button>
				</div>
				</form>
			</div>
		</div>
	</div>

	<!-- 모달창: 비밀번호 -->
	<div class="modal fade" id="passModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">비밀번호 변경</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="old" class="col-form-label"> 기존 비밀번호</label> <input
								type="text" class="form-control" id="recipient-name">
						</div>
						<div class="form-group">
							<label for="new-name" class="col-form-label">새로운 비밀번호</label> <input
								type="text" class="form-control" id="recipient-name"> <label
								for="new-name" class="col-form-label">새로운 비밀번호 확인</label> <input
								type="text" class="form-control" id="recipient-name">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-warning">변경하기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 모달창: 전화번호>전화번호인증 -->
	<div class="modal fade" id="phoneModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">전화번호 변경</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="old" class="col-form-label">번호입력</label> <input
								type="text" class="form-control" id="recipient-name">
						</div>
						<div class="form-group">
							<label for="new-name" class="col-form-label">인증번호</label> <input
								type="text" class="form-control" id="recipient-name">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-warning">변경하기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 모달창: 이메일 -->
	<div class="modal fade" id="emailModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="emailModalLabel">이메일 변경</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="old" class="col-form-label">기존 이메일</label> <input
								type="text" class="form-control" id="recipient-name">
						</div>
						<div class="form-group">
							<label for="new-name" class="col-form-label">새로운 이메일</label> <input
								type="text" class="form-control" id="recipient-name">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-warning">변경하기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 모달창: 주소 -->
	<div class="modal fade" id="addrModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">주소 변경</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class=" mb-3">
							<select class="custom-select d-block w-100" id='sido' 
								required onchange="updateSecondCombo()">
								<option value="">시/도</option>

							</select>

						</div>
						<div class=" mb-3">
							<select class="custom-select d-block w-100" id="sigun"
								 required>
								<option value="">시/군/구</option>
							</select>
						</div>
						<div class=" mb-3">
							<select class="custom-select d-block w-100" id="dong"
								required>
								<option value="읍/면/동">읍/면/동</option>
							</select>
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-warning">변경하기</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
		crossorigin="anonymous"></script>

	<script type="text/javascript">
		/* 닉네임 */
		$('#nicknameModal').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget) // Button that triggered the modal
			var recipient = button.data('whatever') // Extract info from data-* attributes
			// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
			// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
			var modal = $(this)
			//modal.find('.modal-title').text('New message to ' + recipient)
			modal.find('.modal-body input').val(recipient)
		})
		/* 비밀번호 */
		$('#passModal').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget)
			var recipient = button.data('whatever')
			var modal = $(this)

			modal.find('.modal-body input').val(recipient)
		})
		/* 전화번호 */
		$('#nicknameModal').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget)
			var recipient = button.data('whatever')
			var modal = $(this)
			modal.find('.modal-body input').val(recipient)
		})
		/* 이메일 */
		$('#emailModal').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget)
			var recipient = button.data('whatever')
			var modal = $(this)
			modal.find('.modal-body input').val(recipient)
		})
		/* 주소 */
		$('#addrModal').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget)
			var recipient = button.data('whatever')
			var modal = $(this)
			modal.find('.modal-body input').val(recipient)
		})
		
		/* 탈퇴 */
		function clkBtn() {
			var result = confirm("탈퇴 후 서비스 이용이 불가능합니다. 정말로 탈퇴하시겠습니까?");
	        if(result){
	        	var out = prompt("비밀번호를 입력해주세요");
	        	console.log(out);
	        	if(out=='<%=user.getPassword()%>'){
	        		alert('탈퇴가 완료되었습니다.');

	        		window.location.href = "/carrot/member/delete?id=<%=user.getUser_id()%>";
				} else {

					alert("비밀번호가 일치하지 않습니다.");
				}
			}
		}

	</script>
	<script src="https://code.jquery.com/jquery-latest.min.js"
		type="application/javascript"></script>
	<script type="application/javascript"
		src="https://zelkun.tistory.com/attachment/cfile8.uf@99BB7A3D5D45C065343307.js"></script>
	<script type="application/javascript">
		
		
		
		jQuery(document).ready(function () {
			//sido option 추가
			jQuery.each(hangjungdong.sido, function (idx, code) {
				//append를 이용하여 option 하위에 붙여넣음
				jQuery('#sido').append(fn_option(code.sido, code.codeNm));
			});

			//sido 변경시 시군구 option 추가
			jQuery('#sido').change(function () {
				jQuery('#sigun').show();
				jQuery('#sigun').empty();
				jQuery('#sigun').append(fn_option('', '시/군/구')); //
				jQuery.each(hangjungdong.sigugun, function (idx, code) {
					if (jQuery('#sido > option:selected').val() == code.sido)
						jQuery('#sigun').append(fn_option(code.sigugun, code.codeNm));
				});

				//세종특별자치시 예외처리
				//옵션값을 읽어 비교
				if (jQuery('#sido option:selected').val() == '36') {
					jQuery('#sigun').hide();
					//index를 이용해서 selected 속성(attr)추가
					//기본 선택 옵션이 최상위로 index 0을 가짐
					jQuery('#sigugun option:eq(1)').attr('selected', 'selected');
					//trigger를 이용해 change 실행
					jQuery('#sigun').trigger('change');
				}
			});

			//시군구 변경시 행정동 옵션추가
			jQuery('#sigun').change(function () {
				//option 제거
				jQuery('#dong').empty();
				jQuery.each(hangjungdong.dong, function (idx, code) {
					if (jQuery('#sido > option:selected').val() == code.sido && jQuery('#sigun > option:selected').val() == code.sigugun)
						jQuery('#dong').append(fn_option(code.dong, code.codeNm));
				});
				//option의 맨앞에 추가
				jQuery('#dong').prepend(fn_option('', '읍/면/동'));
				//option중 선택을 기본으로 선택
				jQuery('#dong option:eq("")').attr('selected', 'selected');
			});

			jQuery('#dong').change(function () {
				var sido = jQuery('#sido option:selected');
				var sigugun = jQuery('#sigun option:selected');
				var dong = jQuery('#dong option:selected');
			
				var sidoName = sido.text() ; // 시도 이름
				var sigugunName = sigugun.text() ; // 시군구 이름
				var dongName =  dong.text(); // 읍면동 이름
				jQuery('#sidoName').val(sidoName);
				jQuery('#sigugunName').val(sigugunName);
				jQuery('#dongName').val(dongName);
				
			});
		});

		function fn_option(code, name) {
			return '<option value="' + code + '">' + name + '</option>';
		}
	
	
	
	</script>

</body>
</html>