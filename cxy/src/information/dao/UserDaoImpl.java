package information.dao;

import information.bean.User;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Connection;

public class UserDaoImpl extends DBconnection implements UserDao {
	Connection conn=null;
	java.sql.PreparedStatement pstmt=null;
	ResultSet rs=null;
	Connection conn1=null;
	java.sql.PreparedStatement pstmt1=null;
	ResultSet rs1=null;

	public List<User> getAllUsers(){
		List<User> list=new ArrayList<User>();
		String sql=" select * from Book";
		try{
			conn=this.getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			User user=null;
			while(rs.next()){
				user=new User();
				user.setISBN(rs.getString("ISBN"));
				user.setTitle(rs.getString("Title"));
				user.setAuthorID(rs.getInt("AuthorID"));
				String sq2="select * from Author where AuthorID=?";
				try{
					conn1=this.getConnection();
					pstmt1=conn.prepareStatement(sq2);
					pstmt1.setInt(1, user.getAuthorID());
					rs1=pstmt1.executeQuery();
					while(rs1.next()){
						user.setName(rs1.getString("Name"));
					}
				}catch(Exception ex){
					ex.printStackTrace();
				}finally{
					this.Close(conn1, pstmt1, rs1);
				}
				user.setPublisher(rs.getString("Publisher"));
				user.setPublishDate(rs.getString("PublishDate"));
				user.setPrice(rs.getString("Price"));
				list.add(user);
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			this.Close(conn, pstmt, rs);
		}
		return list;
	}

	@Override
	public List<User> queryUser(String Name){
		List<User> list=new ArrayList<User>();
		String sql=" select * from Author where Name=?";
		try{
			conn=this.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, Name);
			rs=pstmt.executeQuery();
			User user=null;
			while(rs.next()){
				user=new User();
				user.setAuthorID(rs.getInt("AuthorID"));
				String sql2="select * from Book where AuthorID=?";
				try{
					conn1=this.getConnection();
					pstmt1=conn1.prepareStatement(sql2);
					pstmt1.setInt(1, user.getAuthorID());
					rs1=pstmt1.executeQuery();
					User user2=null;
					while(rs1.next()){
						user2=new User();
						user2.setISBN(rs1.getString("ISBN"));
						user2.setTitle(rs1.getString("Title"));
						user2.setName(Name);
						user2.setPublisher(rs1.getString("Publisher"));
						user2.setPublishDate(rs1.getString("PublishDate"));
						user2.setPrice(rs1.getString("Price"));
						list.add(user2);
					}
				}catch(Exception ex){
					ex.printStackTrace();
				}finally{
					this.Close(conn1, pstmt1, rs1);
				}
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			this.Close(conn, pstmt, rs);
		}
		return list;
	}

	@Override
	public User detailUser(String ISBN) {
		User user=new User();
		String sql=" select * from Book where ISBN=?";
		try{
			conn=this.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, ISBN);
			rs=pstmt.executeQuery();
			while(rs.next()){
				user=new User();
				user.setISBN(rs.getString("ISBN"));
				user.setTitle(rs.getString("Title"));
				user.setAuthorID(rs.getInt("AuthorID"));
				user.setPublisher(rs.getString("Publisher"));
				user.setPublishDate(rs.getString("PublishDate"));
				user.setPrice(rs.getString("Price"));
				String sql2="select * from Author where AuthorID=?";
				try{
					conn1=this.getConnection();
					pstmt1=conn1.prepareStatement(sql2);
					pstmt1.setInt(1, user.getAuthorID());
					rs1=pstmt1.executeQuery();
					while(rs1.next()){
						user.setName(rs1.getString("Name"));
						user.setAge(rs1.getString("Age"));
						user.setCountry(rs1.getString("Country"));
					}
				}catch(Exception ex){
					ex.printStackTrace();
				}finally{
					this.Close(conn1, pstmt1, rs1);
				}
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			this.Close(conn, pstmt, rs);
		}
		return user;
	}

	@Override
	public int deleteUser(String ISBN) {
		int result=0;
		String sql="delete from Book where ISBN=?";
		try{
			conn=this.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, ISBN);
			result=pstmt.executeUpdate();
			if(result!=0)
				System.out.println("你删除了一条记录！");
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			this.Close(conn, pstmt, rs);
		}
		return result;
	}

	@Override
	public void updateUser(User user,String ISBN) {
		int tmp=-1;
        String sql = "update Book set AuthorID=?,Publisher=?,PublishDate=?,Price=? where ISBN=?";
        try{  
        	conn = this.getConnection();
        	pstmt = conn.prepareStatement(sql);   
        	String sq2="select AuthorID from Author where Name=? and Age=? and Country=?";
            try{  
            	conn1 = this.getConnection();
            	pstmt1=conn1.prepareStatement(sq2);
    			pstmt1.setString(1, user.getName());
    			pstmt1.setString(2, user.getAge());
    			pstmt1.setString(3, user.getCountry());
                rs1=pstmt1.executeQuery();
                if(rs1.next()){
                	tmp=rs1.getInt("AuthorID");
                }
        	}catch(Exception ex)
        	{  
        		ex.printStackTrace();  
        	}  
        	finally{  
        		this.Close(conn1, pstmt1, rs1);  
        	}
            
            if(tmp!=-1){ 
            	pstmt.setInt(1, tmp);  
            }
            else{
            	String sq3 = "insert into Author(Name,Age,Country) values(?,?,?)";
                try{ 
                    conn1 = this.getConnection();
                    pstmt1 = conn1.prepareStatement(sq3);  
                    pstmt1.setString(1, user.getName());  
                    pstmt1.setString(2, user.getAge());  
                    pstmt1.setString(3, user.getCountry()); 
                    pstmt1.executeUpdate();
                }catch(Exception ex)  
                {  
                    ex.printStackTrace();  
                }  
                finally{  
                    this.Close(conn1, pstmt1, rs1);  
                }
                
                String sq4="select AuthorID from Author where Name=? and Age=? and Country=?";
            	conn1 = this.getConnection();
            	pstmt1=conn1.prepareStatement(sq4);
    			pstmt1.setString(1, user.getName());
    			pstmt1.setString(2, user.getAge());
    			pstmt1.setString(3, user.getCountry());
                rs1=pstmt1.executeQuery();
                
                if(rs1.next()){
                	tmp=rs1.getInt("AuthorID");
                }
                pstmt.setInt(1, tmp);  
            }
        	pstmt.setString(2, user.getPublisher());  
        	pstmt.setString(3, user.getPublishDate());  
        	pstmt.setString(4, user.getPrice());
        	pstmt.setString(5, ISBN);
        	pstmt.executeUpdate();
        }catch(Exception ex)
        {  
        	ex.printStackTrace();  
        }  
        finally{  
        	this.Close(conn, pstmt, rs);  
        }
	}
	

    @Override  
    public String addUser(User user) {
    	
    	String t="";
    	String sql0 = "select * from Book where ISBN=?";
        try{ 
            conn1 = this.getConnection();
            pstmt1=conn1.prepareStatement(sql0);
    		pstmt1.setString(1, user.getISBN());
            rs1=pstmt1.executeQuery();
            if(rs1.next()){
                t=rs1.getString("ISBN");
            }
            }catch(Exception ex)  
            {  
                ex.printStackTrace();  
            }  
            finally{  
                this.Close(conn1, pstmt1, rs1);  
            }
        if(!t.equals(""))
        	return "false";
    	
        else{
    	int tmp=-1;
        String sql = "insert into Book(ISBN,Title,AuthorID,Publisher,PublishDate,Price) values(?,?,?,?,?,?)";
        try{ 
            conn = this.getConnection();
            pstmt = conn.prepareStatement(sql);  
            try{
            	String sq2="select AuthorID from Author where Name=? and Age=? and Country=?";
            	conn1 = this.getConnection();
            	pstmt1=conn1.prepareStatement(sq2);
    			pstmt1.setString(1, user.getName());
    			pstmt1.setString(2, user.getAge());
    			pstmt1.setString(3, user.getCountry());
                rs1=pstmt1.executeQuery();
                
                if(rs1.next()){
                	tmp=rs1.getInt("AuthorID");
                }
            }catch(Exception ex)  
            {  
                ex.printStackTrace();  
            }  
            finally{  
                this.Close(conn1, pstmt1, rs1);  
            }
            if(tmp!=-1){
            	pstmt.setString(1, user.getISBN());  
                pstmt.setString(2, user.getTitle());  
                pstmt.setInt(3, tmp);  
                pstmt.setString(4, user.getPublisher());  
                pstmt.setString(5, user.getPublishDate());  
                pstmt.setString(6, user.getPrice());
            	pstmt.executeUpdate();
            }
            else{
            	String sq3 = "insert into Author(Name,Age,Country) values(?,?,?)";
                try{ 
                    conn1 = this.getConnection();
                    pstmt1 = conn1.prepareStatement(sq3);  
                    pstmt1.setString(1, user.getName());  
                    pstmt1.setString(2, user.getAge());  
                    pstmt1.setString(3, user.getCountry()); 
                    pstmt1.executeUpdate();
                }catch(Exception ex)  
                {  
                    ex.printStackTrace();  
                }  
                finally{  
                    this.Close(conn1, pstmt1, rs1);  
                }
                
                String sq4="select AuthorID from Author where Name=? and Age=? and Country=?";
            	conn1 = this.getConnection();
            	pstmt1=conn1.prepareStatement(sq4);
    			pstmt1.setString(1, user.getName());
    			pstmt1.setString(2, user.getAge());
    			pstmt1.setString(3, user.getCountry());
                rs1=pstmt1.executeQuery();
                
                if(rs1.next()){
                	tmp=rs1.getInt("AuthorID");
                }
                pstmt.setString(1, user.getISBN());  
                pstmt.setString(2, user.getTitle());  
                pstmt.setInt(3, tmp);  
                pstmt.setString(4, user.getPublisher());  
                pstmt.setString(5, user.getPublishDate());  
                pstmt.setString(6, user.getPrice());
            	pstmt.executeUpdate();
            }
        }catch(Exception ex)  
        {  
            ex.printStackTrace();  
        }  
        finally{  
            this.Close(conn, pstmt, rs);  
        }
        return "success";}
    }

	@Override
	public User getUserByISBN(String ISBN) {
        User user = null;  
        String sql = " select * from Book where ISBN =?"; 
        try{  
            conn = this.getConnection();  
            pstmt = conn.prepareStatement(sql); 
            pstmt.setString(1, ISBN);
            rs = pstmt.executeQuery();  
            if(rs.next()){  
                user = new User();  
                user.setISBN(rs.getString("ISBN"));  
                user.setTitle(rs.getString("Title"));
                user.setAuthorID(rs.getInt("AuthorID"));  
                user.setPublisher(rs.getString("Publisher"));  
                user.setPublishDate(rs.getString("PublishDate"));  
                user.setPrice(rs.getString("Price"));     
            }  
        }catch(Exception ex)  
        {  
            ex.printStackTrace();  
        }finally{  
            this.Close(conn, pstmt, rs);  
        } 
        String sq2="select * from Author where AuthorID=?";
        try{  
            conn = this.getConnection();  
            pstmt = conn.prepareStatement(sq2); 
            pstmt.setInt(1, user.getAuthorID());
            rs = pstmt.executeQuery();  
            if(rs.next()){  
                user.setName(rs.getString("Name"));  
                user.setAge(rs.getString("Age"));
                user.setCountry(rs.getString("Country"));     
            }  
        }catch(Exception ex)  
        {  
            ex.printStackTrace();  
        }finally{  
            this.Close(conn, pstmt, rs);  
        }
        return user; 
	} 
}
