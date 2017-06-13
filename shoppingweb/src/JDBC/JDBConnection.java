package JDBC;

import java.sql.*;

public class JDBConnection {
	/**
	 * 
	 */
	private final String dbDrive="com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private final String URL="jdbc:sqlserver://localhost:1433;DatabaseName=shoppingweb";
	private final String username="sa";
	private final String password="q1539496189";
	private Connection con=null;
  
    private Statement stm;  
    private ResultSet rs;  
	
	
	public JDBConnection(){			//通过构造方法加载数据库驱动
		try
		  {
		   Class.forName(dbDrive).newInstance();
		  }
		  catch(Exception ex)
		  {
		   System.out.print("数据库加载失败");
		  }   
	}
	
	public boolean createConnection(){		//创建数据库连接
		try{
			con =DriverManager.getConnection(URL,username,password);
			con.setAutoCommit(true);
			System.out.println("链接成功");
		}
		catch(SQLException e){
		}
		return true;
	}
	
	/*public static void main(String[] args) {
		JDBConnection zz=new JDBConnection();
		zz.executeUpdate("");
		
		
	}*/
	
	public boolean executeUpdate(String sql){	//对数据表进行的操作  可以插入、修改、删除等
		if(con == null){
			createConnection();
		}
		try{
			Statement stmt=con.createStatement();
			//String sql1 = "insert into userinfo values('5','kkk','dsa',1,'dd','email','ss')";  
			int iCount =stmt.executeUpdate(sql);
			System.out.println("操作成功，所影响的记录数为"+String.valueOf(iCount));
			return true;
		}catch(SQLException e){
			System.out.println("添加记录异常");
			return false;
		}
	}
	

	public ResultSet executeQuery(String sql){	//对数据库进行查询操作
		try{
			if(con == null){
				createConnection();
			}
			Statement stmt = con.createStatement();
				rs =stmt.executeQuery(sql);
				return rs;
		}catch(Exception e){
			return null;
		}
	}
	
	 public boolean next(){  				//判断 有无数据
	        boolean b = false;  
	        try {  
	            if(rs.next()){  
	                b = true;  
	            }  
	        } catch (SQLException e) {  
	            // TODO Auto-generated catch block  
	            e.printStackTrace();  
	        }  
	        return b;  
	    } 
	
	public void closeConnection(){		//关闭数据库连接
		if(con == null){
			try{
				con.close();
			}catch(SQLException e){
			}
		}	
	}
	
	public void closeStm(){				//关闭stmt对象
		 try {  
	                if (stm != null) {  
	                	 stm.close();  
	                }  
	        } catch (SQLException e) {  
	            // TODO Auto-generated catch block  
	            e.printStackTrace();  
	        }  
	}
	
	 //关闭ResultSet  
    public void closeRs() {  
        try {  
            if (rs != null) {  
                rs.close();  
            }  
        } catch (SQLException e) {  
            // TODO Auto-generated catch block  
            e.printStackTrace();  
        }  
    }

	public Connection getCon() {
		return con;
	}

	public void setCon(Connection con) {
		this.con = con;
	}

	public Statement getStm() {
		return stm;
	}

	public void setStm(Statement stm) {
		this.stm = stm;
	}

	public ResultSet getRs() {
		return rs;
	}

	public void setRs(ResultSet rs) {
		this.rs = rs;
	}

	public String getDbDrive() {
		return dbDrive;
	}

	public String getURL() {
		return URL;
	}

	public String getUsername() {
		return username;
	}

	public String getPassword() {
		return password;
	}  
    
    
	
	/*--public boolean executeUpdate(String name,String password,String sex,String realname,String tel,String email){
	try{
		String sql="insert into userinfo values (?,?,?,?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1,null);
		pstmt.setString(2, name);
		pstmt.setString(3, password);
		pstmt.setString(4,sex);
		pstmt.setString(5,realname);
		pstmt.setString(6,tel);
		pstmt.setString(7,email);
		pstmt.executeQuery(sql);
		return true;
	}
	catch(SQLException e){
		return false;
	}
}
--*/
}
