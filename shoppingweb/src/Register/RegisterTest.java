package Register;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import JDBC.JDBConnection;


public class RegisterTest {
	//注册验证
	
	//验证账号是否已经被注册
	public boolean isExist(String username){  
        boolean isValid = false;  
        JDBConnection db = new JDBConnection();  
        if(db.createConnection()){  
            String sql = "select * from userinfo where username='"+username+"'";  
            db.executeQuery(sql); 
            System.out.println("dsds");
            if(db.next()){  
                isValid = true;  
            }  
            db.closeRs();  
            db.closeStm();  
            db.closeConnection();  
        }  
        return isValid;  
    }
	
	//判读账号、密码是否为空
	public boolean isNull(String t1,String t2){
		boolean isValid=true;
		if((t1.equals("")) && (t2.equals(""))){
			isValid =false;
		}
		return isValid;
	}
	
	//判断两次输入密码是否相同
	public boolean isSame(String t1,String t2){
		boolean isValid =false;
		if(t1.equals(t2)){
			isValid=true;
		}
		return isValid;
	}
	
/*	//输入的电话号码为11位
	public boolean isLength(String s1){
		boolean isValid =false;
		if(s1.length()==11){
			isValid=true;
		}
		return isValid;
	}*/
	
	
	public boolean checkEmail(String email){
        boolean flag = false;
        try{
                String check = "^([a-z0-9A-Z]+[-|_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
                Pattern regex = Pattern.compile(check);
                Matcher matcher = regex.matcher(email);
                flag = matcher.matches();
            }catch(Exception e){
                flag = false;
            }
        return flag;
    }
     
    /**
     * 验证手机号码
     * @param mobiles
     * @return
     */
    public boolean checkMobileNumber(String mobileNumber){
        boolean flag = false;
        try{
                Pattern regex = Pattern.compile("^(((13[0-9])|(15([0-3]|[5-9]))|(18[0,5-9]))\\d{8})|(0\\d{2}-\\d{8})|(0\\d{3}-\\d{7})$");
                Matcher matcher = regex.matcher(mobileNumber);
                flag = matcher.matches();
            }catch(Exception e){
                flag = false;
            }
        return flag;
    }
	
	/*public static void main(String[] args) {
		RegisterTest ss=new RegisterTest();
		boolean a=ss.add("qwer123", "123", 1, "", "", "");
	    System.out.println(a);
	}*/
	
	//值从传递过来注册用户  
    public boolean add(int idnumber,String name,String password,int i,String realname,String tel,String email ){  
        boolean isValid = false;  
        JDBConnection db = new JDBConnection();  
       
        
        //然后do下面的
        if(db.createConnection()){  
            
			String sql = "insert into userinfo values('"+idnumber+"','"+name+"','"+password+"','"+i+"','"+realname+"','"+tel+"','"+email+"')";  
         
        	isValid = db.executeUpdate(sql); 
            db.closeStm();  
            db.closeConnection();
        }  
        return isValid;  
    }  
}
