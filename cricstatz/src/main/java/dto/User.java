package dto;



import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.context.annotation.Scope;



@Scope("session")
@Entity
@Table(name="User")
public class User {
	@Id
	private String emailId;
	private String userName;
	private String password;	
	private String userRole;



	public User() {
		super();

	}


	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getUserRole() {
		return userRole;
	}
	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

	public User(String emailId) {
		super();
		this.emailId = emailId;
	}
	public User(String userName, String password, String emailId, String userRole) {
		super();
		this.userName = userName;
		this.password = password;
		this.emailId = emailId;
		this.userRole = userRole;
	}
	@Override
	public String toString() {
		return "User [userName=" + userName + ", password=" + password + ", emailId=" + emailId + ", userRole="
				+ userRole + "]";
	}



}
