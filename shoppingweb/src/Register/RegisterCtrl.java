package Register;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import JDBC.JDBConnection;

public class RegisterCtrl {
	private String Rusername;
	private String Rpassword;
	private String Rpassword1;
	private String Sex;
	private String Realname;
	private String Telnum;
	private String Email;

	public String getRusername() {
		return Rusername;
	}

	public void setRusername(String rusername) {
		Rusername = rusername;
	}

	public String getRpassword() {
		return Rpassword;
	}

	public void setRpassword(String rpassword) {
		Rpassword = rpassword;
	}

	public String getRpassword1() {
		return Rpassword1;
	}

	public void setRpassword1(String rpassword1) {
		Rpassword1 = rpassword1;
	}

	public String getSex() {
		return Sex;
	}

	public void setSex(String sex) {
		Sex = sex;
	}

	public String getRealname() {
		return Realname;
	}

	public void setRealname(String realname) {
		Realname = realname;
	}

	public String getTelnum() {
		return Telnum;
	}

	public void setTelnum(String telnum) {
		Telnum = telnum;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String execute() throws SQLException // execute方法无参数，必须返回字符串，当然还可以有其他方法
	{
		JDBConnection connection = new JDBConnection();
		//设置自动增长的id值index
		int index = 0; 
	    String maxIDSql="select max(id) as id from userinfo"; 
		ResultSet sqlRst = connection.executeQuery(maxIDSql); 
	    if(sqlRst.next()){ 
	        index = sqlRst.getInt("id")+1;  
	    }else{ 
	        index = 0; 
	    }  
	    
	    int intsex =Integer.parseInt(Sex);
		//检测是否有重名，返回布尔值isExist
		RegisterTest isPass =new RegisterTest();
		boolean isExist =isPass.isExist(Rusername);
		//检测账号密码空值
	    boolean isNull =isPass.isNull(Rusername, Rpassword);		
		//检测两次密码输入是否相同
		boolean isSame =isPass.isSame(Rpassword, Rpassword1);
		//检测电话号码是否通过
		boolean isTel=isPass.checkMobileNumber(Telnum);
		//检测邮箱的格式
		boolean isEmail=isPass.checkEmail(Email);
	    		
		List<String>info=new ArrayList<String>();//保存所有返回信息 
		if(isExist){
			info.add("此账号已经被注册，请重新输入一个账号");
		}
		else if(!isNull){
			info.add("用户名或者密码为空"); 
		}
		else if(!isSame){
			info.add("输入密码不一致，请返回重新输入"); 
		}
		else if(!isEmail){
			info.add("邮箱格式不正确，请重新输入"); 
		}
		else if(!isTel){
			info.add("电话号码格式不正确，请重新输入"); 
		}
		else {
			isPass.add(index,Rusername, Rpassword, intsex, Realname, Telnum, Email);
			return "success";
		}
		
		HttpSession session = ServletActionContext.getRequest().getSession();   
		session.setAttribute("info",info);
		return "error";
	}
}
