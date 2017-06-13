package Register;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import JDBC.JDBConnection;


public class RegisterTest {
	//ע����֤
	
	//��֤�˺��Ƿ��Ѿ���ע��
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
	
	//�ж��˺š������Ƿ�Ϊ��
	public boolean isNull(String t1,String t2){
		boolean isValid=true;
		if((t1.equals("")) && (t2.equals(""))){
			isValid =false;
		}
		return isValid;
	}
	
	//�ж��������������Ƿ���ͬ
	public boolean isSame(String t1,String t2){
		boolean isValid =false;
		if(t1.equals(t2)){
			isValid=true;
		}
		return isValid;
	}
	
/*	//����ĵ绰����Ϊ11λ
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
     * ��֤�ֻ�����
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
	
	//ֵ�Ӵ��ݹ���ע���û�  
    public boolean add(int idnumber,String name,String password,int i,String realname,String tel,String email ){  
        boolean isValid = false;  
        JDBConnection db = new JDBConnection();  
       
        
        //Ȼ��do�����
        if(db.createConnection()){  
            
			String sql = "insert into userinfo values('"+idnumber+"','"+name+"','"+password+"','"+i+"','"+realname+"','"+tel+"','"+email+"')";  
         
        	isValid = db.executeUpdate(sql); 
            db.closeStm();  
            db.closeConnection();
        }  
        return isValid;  
    }  
}
