<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서관리</title>
<meta name="description"
	content="A Bootstrap 4 admin dashboard theme that will get you started. The sidebar toggles off-canvas on smaller screens. This example also include large stat blocks, modal and cards. The top navbar is controlled by a separate hamburger toggle button." />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="generator" content="Codeply">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/CSS/styles.css" />
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
	<div class="container-fluid" id="main">
		<div class="row row-offcanvas row-offcanvas-left">

			<!-- 본문, 내가 할 거 -->
			<div class="col main pt-5 mt-3">
				<h1 class="display-4 d-none d-sm-block">YES25 도서관리</h1>
				<hr>
				<!-- 검색창 -->

				<div id="app">

					<!-- #2 : Modal Window -->
					<div v-show="is_show">
						<%--글작성/보기/수정 대화상자 --%>
						<form @submit.prevent="submitForm">
							<div class="container">
								<h3 class="title">도서 등록</h3>

								<span class="close" title="Close Modal">&times;</span> <input
									type="hidden" name="uid">
								<%-- 삭제나 수정 위해 필요 --%>

								<div class="d01 btn_group_header">
									<div class="left">
										<p id="viewcnt"></p>
									</div>
									<div class="right">
										<p id="regdate"></p>
									</div>
									<div class="clear"></div>
								</div>

								<label for="subject"><b>도서제목</b></label> 
								<input type="text" id="subject" v-model="subject" required> 
								
								<label for="price"><b>도서가격</b></label> 
								<input type="text" id="price" v-model="price">
								
								<label for="author"><b>저자</b></label>
								<input type="text" id="author" v-model="author" required> 
								
								<label for="content"><b>도서내용</b></label>
								<textarea id="content" v-model="content"></textarea>
								
								<div class="d01 btn_group_write">
									<input type="submit" class="" value="등록">
								</div>
							</div>
						</form>

						<button @click="handle_toggle" type="button">취소</button>
					</div>

				</div>
				<script>
var modal = new Vue({
  el: '#app',
  data: function() { // #1
    return {
      is_show: false,
      
    },
    {
    	subject: '',
        price: '200',
        author: '',
        content: ''  
    }
  },
  methods:{
    handle_toggle: function(){ 
      this.is_show = !this.is_show; // #2, #3
    },
    submitForm: function(){	    	
    	axios.post(`ajax/insert.ajax`, {
    		"subject" : this.subject,
    		"price" : this.price,
    		"author" : this.author,
    		"content" : this.content,
    	}) 
    	.catch( error => { console.log('failed', error) })
    }
  }
});
</script>

				<div class="row my-4">
					<div class="col-lg-10 col-md-9">
						<div class="table-responsive">
							<table class="table table-striped">
								<thead class="thead-inverse">
									<tr>
										<th>번호</th>
										<th>사진</th>
										<th>제목</th>
										<th>가격</th>
										<th>수정 삭제</th>
									</tr>
								</thead>
								<tbody id="mainTab">
									<tr v-for="post in posts">
										<td>{{post.bookUid}}</td>
										<td></td>
										<td>{{post.subject}}</td>
										<td>{{post.price}}</td>
										<td>수정</td>
									</tr>
								</tbody>
							</table>
							<script>
				var example1 = new Vue({
					el : '#mainTab',
					data : {
						posts: []
					},
					created(){
						fetch('http://localhost:8109/yes25_project/products/ajax/list.ajax')
							.then((response) => {
								if(response.ok){
									return response.json();
								}
								
								throw new Error('Network response was not ok');
							})
							.then((json) => {
								this.posts = json;
							})
							.catch((error) =>{
								console.log(error);
							});							
					}
				});	
				</script>

						</div>
					</div>
				</div>
				<!--/row-->
				<div class="row">
					<button>도서등록</button>
				</div>

			</div>
			<!--/main col-->
			<!-- 본문, 내가 할 거 끝 -->
		</div>

	</div>

	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

	<script src="${pageContext.request.contextPath}/JS/scripts.js"></script>
</body>
</html>