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
          String username=req.getParameter("username");//接受userid内容 
          String userpwd=req.getParameter("userpwd");//接受password内容 
          List<String>info=new ArrayList<String>();//保存所有返回信息 
          
          if(info.size()==0){//用户名和密码验证通过 
            User user=new User();//实例化VO 
            user.setName(username);//设置password 
            try{ 
            	loginTest logintest =new loginTest();
            	boolean flag=logintest.valid(username, userpwd);
            	if(flag){//验证通过 
                    info.add("用户登录成功，欢迎"+user.getName()+"光临！"); 
                }else{ 
                    info.add("用户登录失败，错误的用户名和密码！"); 
                    req.setAttribute("info",info);//保存错误信息 
                    req.getRequestDispatcher("login.jsp").forward(req, resp);//跳转 
                } 
            }catch(Exception e){ 
                e.printStackTrace(); 
            } 
          } 
          req.setAttribute("info",info);//保存错误信息 
          
          HttpSession session = req.getSession();
          session.setAttribute("user", username);  
  	    	session.setMaxInactiveInterval(3*60); 
  	    	
          req.getRequestDispatcher("index.jsp").forward(req, resp);//跳转 
        } 
      public void doPost(HttpServletRequest req,HttpServletResponse resp) 
               throws ServletException,IOException{ 
          this.doGet(req, resp);//调用doGet()操作 
      } 
} 