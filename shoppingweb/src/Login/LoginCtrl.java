package Login;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;


public class LoginCtrl { // �������������javabean��ʽ����ģ�ͼȿ�����javabeaanҲ��������ͨJava��
	private String loginname; // ���ı����ʽ��struts2����»��Զ�ת��
	private String loginpassword; // ��Ա�����ͱ�Ԫ��name����ֵ��ͬ����Ϊ����Ϣ�����ύ����������

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

	public String execute() // execute�����޲��������뷵���ַ�������Ȼ����������������
	{
		System.out.println("ִ�п��������execute()");
		User user = new User();
		user.setName(loginname);
		
		//List<String> info = new ArrayList<String>();// �������з�����Ϣ
		
		loginTest logintest = new loginTest();
		boolean flag = logintest.valid(loginname, loginpassword);
		String loginid = logintest.getid(loginname, loginpassword);
		if (flag) {// ��֤ͨ��
			//info.add("��ӭ����" + user.getName());			
			
			//����¼�ɹ����û����Լ������ݿ��ȡ�����û����浽session��Ϣ
			HttpSession loginnamesession = ServletActionContext.getRequest().getSession();   
			loginnamesession.setAttribute("loginname", loginname);
			loginnamesession.setMaxInactiveInterval(10 * 60);
			
			HttpSession loginidsession = ServletActionContext.getRequest().getSession();   
			loginidsession.setAttribute("loginid", loginid);
			loginidsession.setMaxInactiveInterval(10 * 60);
			return "success";
		} else {
			//info.add("�û���¼ʧ�ܣ�������û��������룡");
			System.out.println("error");
			return "error";
		}
	}
}
