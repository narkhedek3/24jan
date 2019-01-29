package dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import dto.MatchDetails;
import dto.Player;

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

}
