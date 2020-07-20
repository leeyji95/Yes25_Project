var page = 1		// 현재 페이지
var pageRows = 10   // 한 페이지에 보여지는 게시글 개수

$(document).ready(function() {
	// 게시판 목록 1페이지 로딩
	loadPage(page);
	
	//글 작성 submit 되면
	$("#frmWrite").submit(function(){
		return chkWrite();
	});



});

// page번째 페이지 로딩
function loadPage(page) {
	$.ajax({
		url : "list.ajax?page=" + page + "&pageRows=" + pageRows
		, type : "GET"
		, cache : false
		, success : function(data, status) {
			if(status == "success") {
				//alert('성공')
				updateList(data);
			}
		}
	});
} // end loadPage()

function updateList(jsonObj) {
	result = "";
	
	if(jsonObj.status == "OK") {
		var count = jsonObj.count;
		
		// 전역변수 업데이트!
		window.page = jsonObj.page;
		window.pageRows = jsonObj.pagerows;
		
		var i;
		var items = jsonObj.data;   // 배열
		for(i = 0; i < count; i++){
			result += "<tr>\n";
			
			// 전표번호
			result += "<td>" + items[i].stmt_uid + "</td>\n";
			// 날짜
			result += "<td>" + items[i].regDate + "</td>\n";
			// 계정과목
			result += "<td>" + items[i].account_uid + "</td>\n";
			// 적요
			result += "<td>" + items[i].summary + "</td>\n";
			// 금액
			result += "<td>" + items[i].money + "</td>\n";
						
			result += "</tr>\n";
		} // end for
		$("#list tbody").html(result);  // 테이블 업데이트!
		
		// 페이지 정보 업데이트
		$("#pageinfo").text(jsonObj.page + "/" + jsonObj.totalpage + "페이지, " + jsonObj.totalcnt + "개의 글");
		
		// 페이징 업데이트
		var pagination = buildPagination(jsonObj.writepages, jsonObj.totalpage, jsonObj.page, jsonObj.pagerows);
		$("#pagination").html(pagination);
		
		return true;
	} else {
		alert(jsonObj.message);
		return false;
	}
	return false;
} // end updateList()

function buildPagination(writePages, totalPage, curPage, pageRows){
	var str = "";   // 최종적으로 페이징에 나타날 HTML 문자열 <li> 태그로 구성

	// 페이징에 보여질 숫자들 (시작숫자 start_page ~ 끝숫자 end_page)
    var start_page = ( (parseInt( (curPage - 1 ) / writePages ) ) * writePages ) + 1;
    var end_page = start_page + writePages - 1;

    if (end_page >= totalPage){
    	end_page = totalPage;
    }
    
  	//■  < 표시 여부
    if (start_page > 1) 
    	str += "<li><a onclick='loadPage(" + (start_page -1) + ")' class='tooltip-top' title='이전'><i class='fas fa-angle-left'></i></a></li>\n";
    
    //■  페이징 안의 '숫자' 표시	
	if (totalPage > 1) {
	    for (var k = start_page; k <= end_page; k++) {
	        if (curPage != k)
	            str += "<li><a onclick='loadPage(" + k + ")'>" + k + "</a></li>\n";
	        else
	            str += "<li><a class='active tooltip-top' title='현재페이지'>" + k + "</a></li>\n";
	    }
	}
	
	//■ > 표시
    if (totalPage > end_page){
    	str += "<li><a onclick='loadPage("+ (end_page + 1 ) + ")' class='tooltip-top' title='다음'><i class='fas fa-angle-right'></i></a></li>\n";
    }

    return str;
} // end buildPagination()

function changePageRows(){
	window.pageRows = $("#rows").val();
	loadPage(window.page);
}


// 새 글 작성
function chkWrite() {
	
	var data = $("#frmWrite").serialize();	// 해당 폼 안의 name이 있는 것들을 끌어 들어옴
											// 리턴값은 Object
	// ajax request
	$.ajax({
		url : "writeOk.ajax",
		type : "POST",
		cache : false,
		data : data,  // POST로 ajax request 하는 경우 parameter 담기
		success : function(data, status){
			if(status == "success"){
				if(data.status = "OK") {
					alert("INSERT 성공" + data.count + "개 : " + data.status);
					$('.modal-backdrop').remove();	// 모달창 닫기
					$('#WriteModal').modal('hide');	// 모달창 뒤의 검은 화면 닫기
					loadPage(1);	// 첫 페이지 리로딩
				} else {
					alert("INSERT 실패" + data.status + " : " + data.message);
				}
			} 
		}
	});
	
	// request 후, form 에 입력된것 reset()
	$("#frmWrite")[0].reset();
	// type이 submit일때 비록 action이 없더라도
	// 자기 페이지로 리로딩된다...!!
	// 페이지 리로딩을 원치 않는다면 리턴 값을 false 값을 주면 된다!
	return false;	// 페이지 리로딩은 안 할 것이다
} // end chkWrite();

























