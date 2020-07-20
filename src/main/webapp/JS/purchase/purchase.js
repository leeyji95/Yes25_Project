var page = 1 // 현재 페이지 
var pageRows = 10 // 한 페이지에 보여지는 행 개수
var viewItem = undefined; // 가장 최근에 view 한 글 데이터
var searchType = '';
var keyword = '';

$(document).ready(function(){
	loadPage(page);
	
    // 거래처 등록 버튼 (거래처 관리 페이지)
    $('#reg-pub #insert').click(function(){
        var data = $('#reg-pub').serialize();

        $.ajax({
            type : 'POST',
            url : 'vendor/pubInsert.ajax',
            data : data,
            dataType : 'json',
            success: function(data){
                alert(text(data));
            },
            error: function(){
                alert("에러발생 " + data.message);
            }
        });
    });
    
	// 거래처 검색 버튼 (거래처 관리 페이지)
	$('#pub-search #search').click(function(){
		searchType = $("#pub-search select[name='searchType']").val();
		console.log(searchType);
		keyword = $("#pub-search input[name='keyword']").val();
		console.log(keyword);

		$.ajax({
			type : 'GET',
			url : 'vendor/list.ajax',
			data : {page : 1,
					pageRows : pageRows,
					searchType : searchType,
					keyword : keyword},
			cache : false,
			success : function(data, status){
				if(status == "success"){
					updateList(data);
				}			
			}
		});
	});
	
	// 거래처 검색 enter키 (거래처 관리 페이지)
	$('#pub-search #keyword').keypress(function(event){
	     if(event.keyCode == 13){
	       $('#pub-search #search').click();
	     }
	});
    	
	// 거래처 수정 버튼 (거래처 상세정보 모달창)
	$('#pub-info #update').click(function(){
		setModal('update');
	});
	
	// 거래처 수정 취소 버튼 (거래처 상세정보 모달창)
	$('#pub-info #cancel').click(function(){
		setModal('view');
	});
	
	// 거래처 수정 적용 버튼 (거래처 상세정보 모달창)
	$('#pub-info #apply').click(function(){
		pubUpdate();
	});
	
	// 거래처 삭제 버튼 (거래처 상세정보 모달창)
	$('#pub-info #delete').click(function(){
		deleteByUid(viewItem.pub_uid);
	});
});

// page번째 페이지 로딩
function loadPage(page){
	$.ajax({
		type : 'GET',
		url : 'vendor/list.ajax',
		data : {page : page,
				pageRows : pageRows,
				searchType : searchType,
				keyword : keyword}, 
		cache : false,
		success : function(data, status){
			if(status == "success"){
				if(updateList(data)){
					// 업데이트된 list 에 필요한 이벤트 가동
					addViewEvent();
					// ★ 만약 위 코드를 $(document).ready() 에 두면 동작 안할것이다.!
				}
			}			
		}
	});
} // end loadPage()

function updateList(jsonObj){
	result = ""; 
	
	if(jsonObj.status == "OK"){
		
		var count = jsonObj.count;
		
		// 전역변수 업데이트!
		window.page = jsonObj.page;
		window.pageRows = jsonObj.pagerows;
		
		var i;
		var items = jsonObj.data;   // 배열
		for(i = 0; i < count; i++){
			result += "<tr data-toggle='modal' data-pub_uid='" + items[i].pub_uid + "' data-target='#pub-info' style='cursor: pointer'>\n";
			result += "<td>" + items[i].pub_name + "</td>\n";
			result += "<td>" + items[i].pub_rep + "</td>\n";
			result += "<td>" + items[i].pub_contact + "</td>\n";
			result += "</tr>\n";
		}
		$("#publisher-list").html(result);
		
		// 페이징 업데이트
		var pagination = buildPagination(jsonObj.writepages, jsonObj.totalpage, jsonObj.page, jsonObj.pagerows);
		$("#pagination").html(pagination);
		
		return true;
		
	} else {
		alert(jsonObj.message);
		return false;
	}
	
	return false;
}

// 거래처 수정
function pubUpdate(){
	var data = $('#edit-pub').serialize();
	
	$.ajax({
		type : 'POST',
		url : 'vendor/pubUpdateOk.ajax',
		cache : false,
		data : data,
		success : function(data, status){
			if(status == "success"){
				if(data.status == "OK"){
					alert("수정 성공");
					loadPage(window.page);  // 현재 페이지 리로딩
				} else {
					alert("수정 실패 " + data.message);
				}
				unloadModal();
			}
		}
	});
} // end chkUpdate()

// 거래처 삭제
function deleteByUid(pub_uid){
	if(!confirm("데이터를 삭제 하시겠습니까?")) return false;
	
	$.ajax({
		type : 'POST',
		url : 'vendor/pubDeleteOk.ajax',
		cache : false,
		data : {pub_uid : pub_uid},
		success : function(data, status){
			if(status == "success"){
				if(data.status == "OK"){
					alert("삭제 성공");
					unloadModal();
					loadPage(window.page); // 현재 페이지 리로딩
				} else {
					alert("삭제 실패 " + data.message);
					return false;
				}
			}
		}
	});
	
	return true;
} // end deleteByUid(pub_uid)

function addViewEvent(){
	$('#pub-info').on('show.bs.modal', function(event) {   
		var pub_uid = $(event.relatedTarget).data('pub_uid');
		console.log(pub_uid);
		
		$.ajax({
			type : 'GET',
			url : 'vendor/pubView.ajax',
			data : {pub_uid : pub_uid},
			cache : false,
			success : function(data, status){
				if(status == "success"){
					if(data.status == "OK"){
						viewItem = data.data[0];
						setModal('view');
						
 					} else {
 						alert("에러발생 " + data.message);
 					}
				}
			}
		});
    });
} // end addViewEvent()

function buildPagination(writePages, totalPage, curPage, pageRows){
	var str = "";   // 최종적으로 페이징에 나타날 HTML 문자열 <li> 태그로 구성
	
	// 페이징에 보여질 숫자들 (start_page ~ end_page)
    var start_page = ( (parseInt( (curPage - 1 ) / writePages ) ) * writePages ) + 1;
    var end_page = start_page + writePages - 1;

    if (end_page >= totalPage){
    	end_page = totalPage;
    }
    
    // << 표시 여부
	if(curPage > 1){
		str += "<li class='page-item'><a class='page-link' onclick='loadPage(1)' title='처음'><i class='fa fa-angle-double-left'></i></a></li>\n";
	}
	
  	// < 표시 여부
    if (start_page > 1) 
    	str += "<li class='page-item'><a class='page-link' onclick='loadPage(" + (start_page - 1) + ")' title='이전'><i class='fa fa-angle-left'></i></a></li>\n";
    
    // 페이징 안의 '숫자' 표시	
	if (totalPage > 1) {
	    for (var k = start_page; k <= end_page; k++) {
	        if (curPage != k)
	            str += "<li class='page-item'><a class='page-link' onclick='loadPage(" + k + ")'>" + k + "</a></li>\n";
	        else
	            str += "<li class='page-item active'><a class='page-link' title='현재페이지'>" + k + "</a></li>\n";
	    }
	}
	
	// > 표시
    if (totalPage > end_page){
    	str += "<li class='page-item'><a class='page-link' onclick='loadPage(" + (end_page + 1) + ")' title='다음'><i class='fa fa-angle-right'></i></a></li>\n";
    }

	// >> 표시
    if (curPage < totalPage) {
        str += "<li class='page-item'><a class='page-link' onclick='loadPage(" + totalPage + ")' title='맨끝'><i class='fa fa-angle-double-right'></i></a></li>\n";
    }

    return str;
} // end buildPagination()

// 클릭한 버튼에 따라 모달 속성 변경 (거래처 상세정보 모달창)
function setModal(mode){
	// 거래처 상세정보 보기
	if(mode == 'view'){
		$('#pub-info .modal-title').text("거래처 정보");
		$('#pub-info input').attr('readonly', true);
		$('#pub-info input').css({'border': 'none', 'background-color': 'white'});
		$('#pub-info #update-btns').css('display', 'none');
		$('#pub-info #view-btns').css('display', 'block');
		
		$("#pub-info input[name='pub_uid']").val(viewItem.pub_uid);
		$("#pub-info input[name='pub_name']").val(viewItem.pub_name);
		$("#pub-info input[name='pub_num']").val(viewItem.pub_num);
		$("#pub-info input[name='pub_rep']").val(viewItem.pub_rep);
		$("#pub-info input[name='pub_contact']").val(viewItem.pub_contact);
		$("#pub-info input[name='pub_address']").val(viewItem.pub_address);
	}
	
	if(mode == 'update'){
		$('#pub-info .modal-title').text("거래처 수정");
		$('#pub-info input').attr('readonly', false);
		$('#pub-info input').css('border', '1px solid #ced4da');
		$('#pub-info #view-btns').css('display', 'none');
		$('#pub-info #update-btns').css('display', 'block');
	}
} // end setModal(mode)

//모달 배경이 안사라져서 이 방법으로 해결
function unloadModal(){
	$('#pub-info').modal('hide');
} // end unloadModal()