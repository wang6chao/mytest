package Login;

import java.sql.ResultSet;
import java.sql.SQLException;

import JDBC.JDBConnection;

public class loginTest {
	//µÇÂ½ÑéÖ¤
	public boolean valid(String username,String password){  
		boolean isValid = false;  
	    JDBConnection db = new JDBConnection();  
	    if(db.createConnection()){  
	        String sql = "select * from userinfo where username='"+username+"' and password='"+password+"'";  
	        db.executeQuery(sql);  
	        if(db.next()){  
	            isValid = true;  
	            System.out.println("das");
	        }  
	        db.closeRs();  
	        db.closeStm();  
	        db.closeConnection();  
	    }  
	    return isValid;  
	}
	
	public String getid(String username,String password){  
		
	    JDBConnection db = new JDBConnection();  
	    if(db.createConnection()){  
	        String sql = "select * from userinfo where username='"+username+"' and password='"+password+"'";  
	        ResultSet rs =db.executeQuery(sql);
	        try {
				if(rs.next()){  
				   String loginuserid = rs.getString("id"); 
					return loginuserid;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
	        db.closeRs();  
	        db.closeStm();  
	        db.closeConnection();  
	    }
		return null;  
	}
}
