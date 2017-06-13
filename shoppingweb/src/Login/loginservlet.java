package Login;

import java.io.*; 
import java.util.*; 
import javax.servlet.*; 
import javax.servlet.http.*; 

import Login.loginTest;


public class loginservlet extends HttpServlet{ 
      /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest req,HttpServletResponse resp) 
              throws ServletException,IOException{ 
          String username=req.getParameter("username");//����userid���� 
          String userpwd=req.getParameter("userpwd");//����password���� 
          List<String>info=new ArrayList<String>();//�������з�����Ϣ 
          
          if(info.size()==0){//�û�����������֤ͨ�� 
            User user=new User();//ʵ����VO 
            user.setName(username);//����password 
            try{ 
            	loginTest logintest =new loginTest();
            	boolean flag=logintest.valid(username, userpwd);
            	if(flag){//��֤ͨ�� 
                    info.add("�û���¼�ɹ�����ӭ"+user.getName()+"���٣�"); 
                }else{ 
                    info.add("�û���¼ʧ�ܣ�������û��������룡"); 
                    req.setAttribute("info",info);//���������Ϣ 
                    req.getRequestDispatcher("login.jsp").forward(req, resp);//��ת 
                } 
            }catch(Exception e){ 
                e.printStackTrace(); 
            } 
          } 
          req.setAttribute("info",info);//���������Ϣ 
          
          HttpSession session = req.getSession();
          session.setAttribute("user", username);  
  	    	session.setMaxInactiveInterval(3*60); 
  	    	
          req.getRequestDispatcher("index.jsp").forward(req, resp);//��ת 
        } 
      public void doPost(HttpServletRequest req,HttpServletResponse resp) 
               throws ServletException,IOException{ 
          this.doGet(req, resp);//����doGet()���� 
      } 
} 