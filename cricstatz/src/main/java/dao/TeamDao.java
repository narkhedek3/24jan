package dao;

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
import dto.Tournament;
import dto.User;

@Repository
public class TeamDao {
	@Autowired
	private HibernateTemplate hibernateTemplate;



	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	public void createTeam(final Team team) {
		hibernateTemplate.execute(new HibernateCallback<List<Team>>() {

			public List<Team> doInHibernate(Session session) throws HibernateException {
				Transaction t = session.beginTransaction();
				session.save(team);
				t.commit();
				session.flush();
				session.close();
				return null;
			}
		});
	}

	
	
	public void updateTeam(final Team team) {
		hibernateTemplate.execute(new HibernateCallback<List<Team>>() {

			public List<Team> doInHibernate(Session session) throws HibernateException {
				System.out.println("****************************");
				Transaction t = session.beginTransaction();
				session.update(team);
				t.commit();
				session.flush();
				session.close();
				return null;
			}
		});
	}
		
	
	
	public List<Team> selectTeam() {

		List<Team> list = hibernateTemplate.execute(new HibernateCallback<List<Team>>() {

			public List<Team> doInHibernate(Session session) throws HibernateException {
				Transaction t = session.beginTransaction();
				Query q = session.createQuery("from Team");
				List<Team> teamList = q.list();
				t.commit();
				session.flush();
				session.close();
				return teamList;
			}
		});
		return list;
	}
	
	
	
	public Team getTeam(User user) {		
		Team team = hibernateTemplate.execute(new HibernateCallback<Team>(){			
			public Team doInHibernate(Session session) throws HibernateException {
				
				Transaction t = session.beginTransaction();
				Query q = session.createQuery("from Team where emailId = ?");
				q.setString(0,user.getEmailId());
				
				List<Team> teamList = q.list();				
				if(!teamList.isEmpty())
				{
					for(Team team : teamList)
					{
						
						t.commit();
						session.flush();
						session.close();
						return team;
					}
				}
				
				session.flush();
				session.close();
				return null;
			}
		});
		
		return team;
	}
}
