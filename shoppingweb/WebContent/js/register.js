function tab(pid) {
		var tabs = [ "tab1", "tab2" ];
		/*document.getElementById( "tab1 ").style.display= "none";
		 document.getElementById( "tab12").style.display= "none";*/
		for (var i = 0; i < 2; i++) {
			if (tabs[i] == pid) {
				document.getElementById(tabs[i]).style.display = "block";
			} else {
				document.getElementById(tabs[i]).style.display = "none";
			}
		}
	}

	function fn_focus(ele) {
		if (ele.value == ele.defaultValue) {
			ele.value = '';
		}
	}
	
	function fn_blur(ele) {
		var reg = /^[\s]*$/;
		if (reg.test(ele.value) || ele.value == ele.defaultValue) {
			ele.value = ele.defaultValue;
		}
		
		var ueridObj = document.getElementById("userid");
		var userid = trim(ueridObj.value);
		var useridRegex = /^\w{6,12}$/;

		var msg = "";
		if (!userid) {
			msg = "<font color='red'>账号不能为空！</font>";
		} else if (!useridRegex.test(userid)) {
			msg = "<font color='red'>账号长度不对！</font>";
		}
		var span = document.getElementById("useridSpan");
		span.innerHTML = msg;

		return msg == "  ";
	}
	
	function checkUserinfo() {
		var ueridObj = document.getElementById("userid");
		var userid = trim(ueridObj.value);
		var useridRegex = /^\w{6,12}$/;

		var msg = "";
		if (!userid) {
			msg = "<font color='red'>账号不能为空！</font>";
		} else if (!useridRegex.test(userid)) {
			msg = "<font color='red'>账号长度不对！</font>";
		}
		var span = document.getElementById("useridSpan");
		span.innerHTML = msg;

		return msg == "  ";
	}

	function trim(s) {
		return s.replace(/^\s+|\s+$/g, "");
	}