function update(userId, event) {
	event.preventDefault();
	let data = $("#userUpdate").serialize();
	console.log(data);
	
	$.ajax({
		type:"put",
		url:`/api/user/${userId}/`,
		data: data,
		contentType: "application/x-www-form-urlencoded; charset=utf-8",
		dataType: "json"
	}).done(res=>{
		console.log("성공",res);
		location.href="/";
	}).fail(error=>{
		alert(JSON.stringify(error.responseJSON.errorMap));
		console.log("실패",error.responseJSON.errorMap);
	});
}