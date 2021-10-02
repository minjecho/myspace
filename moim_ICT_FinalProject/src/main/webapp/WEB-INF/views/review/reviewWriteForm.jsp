<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>moim</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<style type="text/css">
.rating .rate_radio {
    position: relative;
    display: inline-block;
    z-index: 20;
    opacity: 0.001;
    width: 60px;
    height: 60px;
    background-color: #fff;
    cursor: pointer;
    vertical-align: top;
    display: none;
}
.rating .rate_radio + label {
    position: relative;
    display: inline-block;
    margin-left: -4px;
    z-index: 10;
    width: 60px;
    height: 60px;
    background-image: url('${ pageContext.servletContext.contextPath }/resources/img/starrate.png');
    background-repeat: no-repeat;
    background-size: 60px 60px;
    cursor: pointer;
    background-color: #f0f0f0;
}
.rating .rate_radio:checked + label {
    background-color: #ff8;
}


</style>
<script type="text/javascript">
function Rating(){};
Rating.prototype.rate = 0;
Rating.prototype.setRate = function(newrate){
    //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
    this.rate = newrate;
    let items = document.querySelectorAll('.rate_radio');
    items.forEach(function(item, idx){
        if(idx < newrate){
            item.checked = true;
        }else{
            item.checked = false;
        }
    });
}

let rating = new Rating();//별점 인스턴스 생성

document.addEventListener('DOMContentLoaded', function(){
    //별점선택 이벤트 리스너
    document.querySelector('.rating').addEventListener('click',function(e){
        let elem = e.target;
        if(elem.classList.contains('rate_radio')){
            rating.setRate(parseInt(elem.value));
        }
    })
});
function getCheckboxValue(event)  {
	  let result = '';
	  if(event.target.checked)  {
	    result = event.target.value;
	  }else {
	    result = event.target.value;
	  }
	  
	  document.getElementById('result').innerText
	    = result;
	  
	  document.form1.review_grade.value=result;
	}
	</script>	
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function change(){
	var selectedVal = $("#selectTeam option:selected").val();
	var field_name;
	console.log(selectedVal);
	$(function() {	
	$.ajax({
		url : 'searchteam.do?team_name='+selectedVal,
		type : 'post',
		data : selectedVal ,
		dataType : 'json',
		success : function(data) {
			
	
			field_name = data["field_name"]
			console.log("success : " + data);
	
			console.log(field_name);
			document.form1.field_name.value=field_name;
			$("#toplist").html(data["field_name"]);
		}, //for in
		error : function(jqXHR, textstatus, errorthrown) {
			console.log("error : " + jqXHR + ", " + textstatus + ", "
					+ errorthrown);
		}
	});

	});
	

}



	</script>


<body>
	<!-- navbar-->
	<c:import url="/WEB-INF/views/common/menubar.jsp" />



<section>
	<br> <br> <br>
	<article>

		<div class="container" role="main">

			<h2>리뷰 작성</h2>

			<div class="row" align="center">
				<form action="rvinsert.do" method="post" name="form1" enctype="multipart/form-data"
					style="align: center;">
					<table class="table table-striped"
						style="text-align: center; border: 1px solid #dddddd; width: 1000px; align: center;">

						<thead>
							
						</thead>
						<tbody>
							<tr>
								<td><input type="text" class="form-control"
									placeholder="글 제목" name="review_title" maxlength="50"
									 required></td>
							</tr>
							<tr>
								<td><select id="selectTeam" name="team_name" class="form-control" onchange="change()" style="padding: 0;" required>
								<option value="" selected>팀 선택</option>
								<c:forEach items="${teamlist}" var="t">
									<option><c:out value="${ t.team_name }"></c:out></option>
								</c:forEach>
								
								</select>
								
								</td>
							</tr>
							<tr>
								<td id="toplist" style="text-align:left;">분야</td>
							</tr>
							
						  <!-- 평점 선택창 -->
											 <tr>
						  <td>
						  <div class="review_rating">
            <div class="warning_msg">별점을 선택해 주세요.</div>
            <div class="rating">
                <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
                <input type="checkbox" id="rating1" value="1" class="rate_radio" title="1점" onclick='getCheckboxValue(event)' checked>
                <label for="rating1" ></label>
                <input type="checkbox" id="rating2" value="2" class="rate_radio" title="2점" onclick='getCheckboxValue(event)'>
                <label for="rating2"></label>
                <input type="checkbox" id="rating3" value="3" class="rate_radio" title="3점" onclick='getCheckboxValue(event)'>
                <label for="rating3"></label>
                <input type="checkbox" id="rating4" value="4" class="rate_radio" title="4점" onclick='getCheckboxValue(event)'>
                <label for="rating4"></label>
                <input type="checkbox" id="rating5" value="5" class="rate_radio" title="5점" onclick='getCheckboxValue(event)'>
                <label for="rating5"></label>
            </div>
        </div>
	<div id='result'></div>
</td>
</tr>
   			<tr>
								<td><textarea class="form-control" placeholder="글 내용"
										name="review_content" maxlength="2048"
										style="height: 350px;" required></textarea></td>
							</tr>
		
							<tr>
							<td align="left">
							<input type="file" name="upfile" style="align:left;">
							</td>
							</tr>
							<tr><td>
							<input type="hidden" name="field_name" value="">
							<input type="hidden" name="review_grade" value="1">
							<input type="hidden" name="review_writer" value="${ loginMember.user_nn }"></td>
							</tr>
						</tbody>
						
					</table>
					<!-- 버튼 --><br>
					<center>
						<input type="submit" value="등록하기" class="btn btn-primary">
						&nbsp; <input type="reset" value="작성취소" class="btn btn-primary">
						&nbsp; <button type="button" class="btn btn-primary" onclick="javascript:history.go(-1); return false;">목록</button>
					</center>
				</form>
			</div>

		</div>






		<div></div>
		<br> <br> <br>

	</article>
</section>

<!-- Footer -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>