package Login;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;


public class LoginCtrl { // 控制器类必须是javabean形式，而模型既可以是javabeaan也可以是普通Java类
	private String loginname; // 中文编码格式在struts2框架下会自动转换
	private String loginpassword; // 成员变量和表单元素name属性值相同，因为表单信息是先提交到控制器的

	public String getLoginname() {
		return loginname;
	}

	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}

	public String getLoginpassword() {
		return loginpassword;
	}

	public void setLoginpassword(String loginpassword) {
		this.loginpassword = loginpassword;
	}

	public String execute() // execute方法无参数，必须返回字符串，当然还可以有其他方法
	{
		System.out.println("执行控制器类的execute()");
		User user = new User();
		user.setName(loginname);
		
		//List<String> info = new ArrayList<String>();// 保存所有返回信息
		
		loginTest logintest = new loginTest();
		boolean flag = logintest.valid(loginname, loginpassword);
		String loginid = logintest.getid(loginname, loginpassword);
		if (flag) {// 验证通过
			//info.add("欢迎您：" + user.getName());			
			
			//将登录成功的用户名以及从数据库获取到的用户保存到session信息
			HttpSession loginnamesession = ServletActionContext.getRequest().getSession();   
			loginnamesession.setAttribute("loginname", loginname);
			loginnamesession.setMaxInactiveInterval(10 * 60);
			
			HttpSession loginidsession = ServletActionContext.getRequest().getSession();   
			loginidsession.setAttribute("loginid", loginid);
			loginidsession.setMaxInactiveInterval(10 * 60);
			return "success";
		} else {
			//info.add("用户登录失败，错误的用户名和密码！");
			System.out.println("error");
			return "error";
		}
	}
}
