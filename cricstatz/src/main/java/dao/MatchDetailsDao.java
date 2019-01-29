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

import dto.MatchDetails;
import dto.Player;
import dto.Team;

@Repository
public class MatchDetailsDao {
	
	@Autowired
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	public void createMatch(final MatchDetails matchDetails ) {
		hibernateTemplate.execute(new HibernateCallback<List<Player>>() {

			public List<Player> doInHibernate(Session session) throws HibernateException {
				Transaction t = session.beginTransaction();
				session.save(matchDetails);
				t.commit();
				session.flush();
				session.close();
				return null;
			}
		});
	}
	
	public void deleteMatch(final MatchDetails matchDetails ) {
		hibernateTemplate.execute(new HibernateCallback<List<Player>>() {

			public List<Player> doInHibernate(Session session) throws HibernateException {
				Transaction t = session.beginTransaction();
				session.delete(matchDetails);
				t.commit();
				session.flush();
				session.close();
				return null;
			}
		});
	}
	
	public List<MatchDetails> selectAllMatches() {

		List<MatchDetails> list = hibernateTemplate.execute(new HibernateCallback<List<MatchDetails>>() {

			public List<MatchDetails> doInHibernate(Session session) throws HibernateException {
				Transaction t = session.beginTransaction();
				Query q = session.createQuery("from MatchDetails");
				List<MatchDetails> matchList = q.list();
				
				t.commit();
				session.flush();
				session.close();
				return matchList;
			}
		});
		return list;
	}
	
	public MatchDetails selectMatchWithTeamId(long matchId) {

		MatchDetails list = hibernateTemplate.execute(new HibernateCallback<MatchDetails>() {

			public MatchDetails doInHibernate(Session session) throws HibernateException {
				Transaction t = session.beginTransaction();
				Query q = session.createQuery("from MatchDetails where matchId= ?");
				q.setLong(0, matchId);
				List<MatchDetails> matchList = q.list();
				System.out.println(matchId+"/*/*/*/");
				MatchDetails match = matchList.get(0);
				t.commit();
				session.flush();
				session.close();
				return match;
			}
		});
		return list;
	}

}
