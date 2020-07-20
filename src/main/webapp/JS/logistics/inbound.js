var page = 1
var pageRows = 5
var viewItem = undefined;

$(document).ready(function() {
	loadPage(page);
	
	$("#btnInbound").click(function(){
		update();
	});

});

function loadPage(page) {

	$.ajax({
		url : "list.ajax?page=" + page + "&pageRows=" + pageRows,
		type : "GET",
		cache : false,
		dataType : "json",
		success : function(data, status) {
			if (status == "success") {
				
				listUp(data)
				
			}

		}

	});

}

function listUp(jsonObj){
	result = "";
	
	if(jsonObj.status == "OK"){
		var count = jsonObj.count;
		
		window.page = jsonObj.page;
		window.pageRows = jsonObj.pageRows;
		
		var i;
		var items = jsonObj.data;
		for(i = 0; i < count; i++){
			result += "<tr>\n";
			result += "<td><input type='checkbox' name='order_uid' value='" + items[i].order_uid + "'></td>\n";
			result += "<td>"+items[i].order_uid + "</td>\n";
			result += "<td>"+items[i].book_uid + "</td>\n";
			result += "<td>"+items[i].order_unit_cost + "</td>\n";
			result += "<td>"+items[i].order_quantity + "</td>\n";
			result += "<td>"+items[i].order_date + "</td>\n";
			result += "<td>"+items[i].order_state + "</td>\n";
			result += "<tr>\n";
		} // end for
		$("#list tbody").html(result);
		
		return true;
	} else { 
		alert(jsonObj.message);
		return false;
	} // end if
	return false;
} // end updateList()



function update(){
	var uids = [];
	$("#list tbody input[name=order_uid]").each(function(){
		if($(this).is(":checked")){
			uids.push($(this).val());
		}
	});
	
	alert(uids);
	
	if(uids.length == 0){
		alert('삭제할 글을 체크해주세요');
	} else{
		if(!confirm(uids.length + "건의 발주를 입고합니다")) return false;
		
		var data = $("#frmList").serialize();
		
		$.ajax({
			url: "update.ajax",
			type: "POST",
			data: data,
			cache: false,
			success: function(data, status){
				if(status== "success"){
					if(data.satus=="OK"){
						alert("입고 완료" + data.count + "건");
						loagPage(window.page);
					} else {
						alert("입고 처리 실패" + data.message);
					}
				}
			}
		});
	}
	return true;
	
}