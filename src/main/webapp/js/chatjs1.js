	function aa() {
				
			var news = $('#msg').val();
			news=news;
			$('#dope').append(news);
			$('#dope').append("<br />");
			Send(news);
			}
			function Send(news) {
	xmlHttp = GetXmlHttpObject()

	if (xmlHttp == null) {

		alert("您的浏览器不支持AJAX！");

		return;

	}

	var url = "http://www.tuling123.com/openapi/api?key=f96ad5be9d1347258ced4efb4d4d0aa8";
	/*59e5a78c5e66412888928b85852ec8c3";*/

	url = url + "&info=" + news;

	url = url + "&userid=1234";

	xmlHttp.onreadystatechange = stateChanged;

	xmlHttp.open("GET", url, true);

	xmlHttp.send(null);
}
function GetXmlHttpObject() {

	var xmlHttp = null;

	try {

		// Firefox, Opera 8.0+, Safari

		xmlHttp = new XMLHttpRequest();

	}

	catch (e) {

		// Internet Explorer

		try {

			xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");

		}

		catch (e) {

			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");

		}

	}

	return xmlHttp;

}
function stateChanged() {

	// xmlHttp.readyState
	// 0 （未初始化）
	// 对象已建立，但是尚未初始化（尚未调用open方法）

	// 1 （初始化）
	// 已调用send()方法，正在发送请求

	// 2 （发送数据）
	// send方法调用完成，但是当前的状态及http头未知

	// 3 （数据传送中）
	// 已接收部分数据，因为响应及http头不全，这时通过responseBody和responseText获取部分数据会出现错误，

	// 4 （完成）
	// 数据接收完毕，此时可以通过通过responseBody和responseText获取完整的回应数据
	if (xmlHttp.readyState == 4) {
		// var msg = eval('(' + xmlHttp.responseText + ')');
		//document.getElementById("robot").innerHTML = msg;
		var text = JSON.parse(xmlHttp.responseText).text;
		$('#dope').append("<br />");
		$('#dope').append(text);
		$('#dope').append("<br />");
		//console.log(xmlHttp.responseText);
	}
}