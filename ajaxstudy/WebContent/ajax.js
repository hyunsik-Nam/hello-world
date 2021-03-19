// ajaxstudy/WebContent/ajax.js
var ajax = null;	//전역변수 선언
function getAjaxObject() {
	if(window.ActiveXObject){
		try{
			return new ActiveXObject("Msxml2.XMLHTTP");
		}catch(e) {
			try{
				return new ActiveXObject("Microsoft.XMLHTTP");
			}catch(e2) {
				return null;
			}
		}
	} else if (window.XMLHttpRequest){
		return new XMLHttpRequest();
	} else{
		return null;
	}
}
function sendRequest(url,params,callback,method){
	ajax = getAjaxObject();
	var httpMethod = method?method:"GET";
	if(httpMethod != "GET" && httpMethod != "POST"){
		httpMethod = "GET";
	}
	var httpParams = (params ==null || params == '')?null:params;
	var httpUrl = url;
	if(httpMethod == "GET" && httpParams != null){
		httpUrL = httpUrl + "?" + httpParams;
	}
	ajax.open(httpMethod,httpUrl,true);
	ajax.setRequestHeader
				("Content-Type","application/x-www-form-urlencoded");
	ajax.onreadystatechange = callback;
	//onreadystatechange : 콜백함수 설정
	//콜백함수 : 서버에서 응답이 온경우 자동으로 호출되는 함수
	//		  서버에서 응답이 오면 ajax 객체의 상태가 변경됨
	//		  /ajax 객체의 상태가 변경시 호출됨
	ajax.send(httpMethod=="POST"?httpParams:null);
}