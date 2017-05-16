package information.dao;

import information.bean.User;

import java.util.List;

public interface UserDao {
	public List<User> getAllUsers();
	public List<User> queryUser(String Name);
	public User detailUser(String ISBN);
	public int deleteUser(String ISBN);
	public User getUserByISBN(String ISBN);
	public String addUser(User user);
	public void updateUser(User user,String ISBN);
}
