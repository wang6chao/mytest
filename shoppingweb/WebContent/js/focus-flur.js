function lg_focus(ele) {
	if (ele.value == ele.defaultValue) {
		ele.value = '';
	}
}

function lg_blur(ele) {
	var reg = /^[\s]*$/;
	if (reg.test(ele.value) || ele.value == ele.defaultValue) {
		ele.value = ele.defaultValue;
	}

	var ueridObj = document.getElementById("loginid");
	var loginid = trim(ueridObj.value);
	var loginidRegex = /^\w{6,12}$/;

	var msg = "";
	if (!loginid) {
		msg = "<font color='red'>账号不能为空！</font>";
	} else if (!loginidRegex.test(loginid)) {
		msg = "<font color='red'>请输入正确账号！</font>";
	}
	var span = document.getElementById("loginidSpan");
	span.innerHTML = msg;

	return msg == "  ";
}

function trim(s) {
	return s.replace(/^\s+|\s+$/g, "");
}