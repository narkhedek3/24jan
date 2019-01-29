package dao;

import java.io.Console;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import dto.Team;
import dto.User;

@Repository
	public class UserDao {

		@Autowired
		private HibernateTemplate hibernateTemplate;

		
		public HibernateTemplate getHibernateTemplate() {
			return hibernateTemplate;
		}

		public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
			this.hibernateTemplate = hibernateTemplate;
		}
		
		
		public void createUser(final User user) {
			
			String originalPassword=user.getPassword();
			user.setPassword(MD5Encryption.getMd5(originalPassword));
			
			hibernateTemplate.execute(new HibernateCallback<List<User>>() {

				public List<User> doInHibernate(Session session) throws HibernateException {
					Transaction t = session.beginTransaction();
					session.save(user);
					t.commit();
					session.flush();
					session.close();
					return null;
				}
			});
		}
			
		public List<User> login(User user)
		{
			List<User> list = hibernateTemplate.execute(new HibernateCallback<List<User>>() {

				@Override
				public List<User> doInHibernate(Session session) throws HibernateException {
					Transaction t = session.beginTransaction();
					Query q = session.createQuery("from User where emailId = ? and password = ? and userRole=?");
					q.setString(0, user.getEmailId());
					q.setString(1, user.getPassword());
					q.setString(1, MD5Encryption.getMd5(user.getPassword()));
					q.setString(2,user.getUserRole());
					List<User> ul = q.list();
					t.commit();
					
					session.flush();
					session.close();
					return ul;
				}
			});
			return list;
		}
		
		
		public List<Team> getTeam(String emailId) {
			List<Team> list = hibernateTemplate.execute(new HibernateCallback<List<Team>>() {

				@Override
				public List<Team> doInHibernate(Session session) throws HibernateException {
					Transaction t = session.beginTransaction();
					Query q = session.createQuery("from Team where emailId = ?");
					q.setString(0, emailId);				
					List<Team> tl = q.list();
					t.commit();					
					session.flush();
					session.close();
					return tl;
				}
			});
			return list;
		}
		
		public User selectUser(String emailId) {
			User user = hibernateTemplate.execute(new HibernateCallback<User>() {

				public User doInHibernate(Session session) throws HibernateException {
					Transaction t = session.beginTransaction();
					User u = (User)session.get(User.class, emailId);
					t.commit();
					session.flush();
					session.close();
					return u;
				}
			});
			return user;
		}
		
}
