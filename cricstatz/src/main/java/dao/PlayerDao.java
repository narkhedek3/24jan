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

import dto.Player;
import dto.Team;
import dto.Tournament;


@Repository
public class PlayerDao {
	@Autowired
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	public void createPlayer(final Player player) {
		hibernateTemplate.execute(new HibernateCallback<List<Player>>() {

			public List<Player> doInHibernate(Session session) throws HibernateException {
				Transaction t = session.beginTransaction();
				session.save(player);
				t.commit();
				session.flush();
				session.close();
				return null;
			}
		});
	}

	public List<Player> selectPlayer() {

		List<Player> list = hibernateTemplate.execute(new HibernateCallback<List<Player>>() {

			public List<Player> doInHibernate(Session session) throws HibernateException {
				Transaction t = session.beginTransaction();
				Query q = session.createQuery("from Player");
				List<Player> playerList = q.list();
				t.commit();
				session.flush();
				session.close();
				return playerList;
			}
		});
		return list;
	}
	
	public List<Player> selectPlayerWithTeamId(Team team) {

		List<Player> list = hibernateTemplate.execute(new HibernateCallback<List<Player>>() {

			public List<Player> doInHibernate(Session session) throws HibernateException {
				Transaction t = session.beginTransaction();
				Query q = session.createQuery("from Player where teamId= ?");
				q.setLong(0, team.getTeamId());
				List<Player> playerList = q.list();
				t.commit();
				session.flush();
				session.close();
				return playerList;
			}
		});
		return list;
	}
}
