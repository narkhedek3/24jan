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
public class TournamentsDao {
	
	@Autowired
	private HibernateTemplate hibernateTemplate;



	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	public void createTournament(final Tournament tournament) {
		hibernateTemplate.execute(new HibernateCallback<List<Tournament>>() {

			public List<Tournament> doInHibernate(Session session) throws HibernateException {
				Transaction t = session.beginTransaction();
				session.save(tournament);
				t.commit();
				session.flush();
				session.close();
				return null;
			}
		});
	}
	
	public List<Tournament> selectTournaments() {
		
		List<Tournament> list = hibernateTemplate.execute(new HibernateCallback<List<Tournament>>() {

			public List<Tournament> doInHibernate(Session session) throws HibernateException {
				Transaction t = session.beginTransaction();
				Query q = session.createQuery("from Tournament");
				List<Tournament> tournamentList = q.list();
				t.commit();
				session.flush();
				session.close();
				return tournamentList;
			}
		});
		return list;
	}

	public Tournament getTournament(User user) {

		Tournament tournament = hibernateTemplate.execute(new HibernateCallback<Tournament>() {

			public Tournament doInHibernate(Session session) throws HibernateException {
				Transaction t = session.beginTransaction();
				Query q = session.createQuery("from Tournament where emailId = ?");
				q.setString(0,user.getEmailId());
				List<Tournament> tournamentList = q.list();
				if(tournamentList.isEmpty()!=true)
				{
					for(Tournament tournament : tournamentList)
					{
						return tournament;
					}
				}
				t.commit();
				session.flush();
				session.close();
				return null;
			}
		});
		return tournament;
	}
	
	
	
	public List<Team> getRegisteredTeams(Tournament tournament) {

		List<Team> list = hibernateTemplate.execute(new HibernateCallback<List<Team>>() {

			public List<Team> doInHibernate(Session session) throws HibernateException {
				Transaction t = session.beginTransaction();
				Query q = session.createQuery("from Team where tournamentId = ?");
				q.setLong(0,tournament.getTournamentId());
				List<Team> teamList = q.list();
				
				t.commit();
				session.flush();
				session.close();
				return teamList;
			}
		});
		return list;
	}
	
	public void updateTournament(final Tournament tournament) {
		hibernateTemplate.execute(new HibernateCallback<List<Tournament>>() {

			public List<Tournament> doInHibernate(Session session) throws HibernateException {
			
				Transaction t = session.beginTransaction();
				session.update(tournament);
				t.commit();
				session.flush();
				session.close();
				return null;
			}
		});
	}
}
