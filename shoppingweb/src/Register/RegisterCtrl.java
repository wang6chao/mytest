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

	public String execute() throws SQLException // execute�����޲��������뷵���ַ�������Ȼ����������������
	{
		JDBConnection connection = new JDBConnection();
		//�����Զ�������idֵindex
		int index = 0; 
	    String maxIDSql="select max(id) as id from userinfo"; 
		ResultSet sqlRst = connection.executeQuery(maxIDSql); 
	    if(sqlRst.next()){ 
	        index = sqlRst.getInt("id")+1;  
	    }else{ 
	        index = 0; 
	    }  
	    
	    int intsex =Integer.parseInt(Sex);
		//����Ƿ������������ز���ֵisExist
		RegisterTest isPass =new RegisterTest();
		boolean isExist =isPass.isExist(Rusername);
		//����˺������ֵ
	    boolean isNull =isPass.isNull(Rusername, Rpassword);		
		//����������������Ƿ���ͬ
		boolean isSame =isPass.isSame(Rpassword, Rpassword1);
		//���绰�����Ƿ�ͨ��
		boolean isTel=isPass.checkMobileNumber(Telnum);
		//�������ĸ�ʽ
		boolean isEmail=isPass.checkEmail(Email);
	    		
		List<String>info=new ArrayList<String>();//�������з�����Ϣ 
		if(isExist){
			info.add("���˺��Ѿ���ע�ᣬ����������һ���˺�");
		}
		else if(!isNull){
			info.add("�û�����������Ϊ��"); 
		}
		else if(!isSame){
			info.add("�������벻һ�£��뷵����������"); 
		}
		else if(!isEmail){
			info.add("�����ʽ����ȷ������������"); 
		}
		else if(!isTel){
			info.add("�绰�����ʽ����ȷ������������"); 
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
