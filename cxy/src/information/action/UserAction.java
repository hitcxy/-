package information.action;

import java.util.List;  

import information.bean.User;  
import information.dao.UserDao;
import information.dao.UserDaoImpl;

public class UserAction {  
	
	private String name;
	private String ISBN;
	private User user;
	public void setName(String name){
		this.name=name;
	}
	public String getName(){
		return name;
	}
	public void setISBN(String ISBN){
		this.ISBN=ISBN;
	}
	public String getISBN(){
		return ISBN;
	}
	public void setUser(User user){
		this.user=user;
	}
	public User getUser(){
		return user;
	}
	//跳转到修改界面
	public String getU(){
		UserDao userDao=new UserDaoImpl();
		user=userDao.getUserByISBN(ISBN);
		return "toUpdate";
	}
	//跳转到详细信息
	public String getdetailUsers(){
		UserDao userDao=new UserDaoImpl();
		user=userDao.getUserByISBN(ISBN);
		return "detailList";
	}
	//图书列表  
    private List<User> userList;  
  
    public List<User> getUserList() {  
        return userList;  
    }  
  
    public void setUserList(List<User> userList) {  
        this.userList = userList;  
    }  
      
    public String getUsers()  
    {  
    	UserDao userDao=new UserDaoImpl();
    	userList=userDao.getAllUsers();
        return "userList";  
    }

    //作者所有图书
    private List<User> bookList;  
    
    public List<User> getBookList() {  
        return bookList;  
    }  
  
    public void setBookList(List<User> bookList) {  
        this.bookList = bookList;  
    }  
      
    public String getqueryUsers()  
    {  
    	UserDao userDao=new UserDaoImpl();
    	bookList=userDao.queryUser(name);
        return "bookList";  
    }
    
    //删除图书
    public String getdeleteUsers()  
    {  
    	UserDao userDao=new UserDaoImpl();
    	userDao.deleteUser(ISBN);
        return this.getUsers();  
    }
    
    //添加图书
    public String getaddUsers() throws Exception  
    {  
        UserDao userDao = new UserDaoImpl();  
        String str=userDao.addUser(user);
        if(str.equals("false")){
        	//javax.swing.JOptionPane.showMessageDialog(null, "图书编号重复，请重新添加！");
        	return "false";
        }
        return this.getUsers(); 
    } 
    
    //修改信息
    public String getupdateUsers() throws Exception  
    {  
        UserDao userDao = new UserDaoImpl();  
        userDao.updateUser(user,ISBN);
        return this.getUsers();  
    } 
}
