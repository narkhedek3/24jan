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

	public List<Player> selectAllPlayer() {

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
	
	
	public Player selectPlayerWithPlayerId(long playerId) {

		Player list = hibernateTemplate.execute(new HibernateCallback<Player>() {

			public Player doInHibernate(Session session) throws HibernateException {
				Transaction t = session.beginTransaction();
				Query q = session.createQuery("from Player where playerId= ?");
				q.setLong(0, playerId);
				List<Player> playerList = q.list();
				Player player = playerList.get(0);
				t.commit();
				session.flush();
				session.close();
				return player;
			}
		});
		return list;
	}
	
	public void updatePlayer(final Player player) {
		hibernateTemplate.execute(new HibernateCallback<List<Team>>() {

			public List<Team> doInHibernate(Session session) throws HibernateException {
				System.out.println(player+"playerDao****************************");
				Transaction t = session.beginTransaction();
				session.update(player);
				t.commit();
				session.flush();
				session.close();
				return null;
			}
		});
	}
	
	public Player selectOnePlayer(int playerId) {
		   Player p = hibernateTemplate.execute(new HibernateCallback<Player>() {

				public Player doInHibernate(Session session) throws HibernateException {
					Transaction t = session.beginTransaction();
					Query q = session.createQuery("from Player where playerId= ?");
					q.setLong(0, playerId);
					Player player=(Player)q.list().get(0);
					//Player p = (Player)session.get(Player.class, playerId);
					t.commit();
					session.flush();
					session.close();
					return player;
				}
			});
			return p;
		}
	
	public void deletePlayer(final Player player) {
		hibernateTemplate.execute(new HibernateCallback<List<Player>>() {

			public List<Player> doInHibernate(Session session) throws HibernateException {
				Transaction t = session.beginTransaction();
				session.delete(player);
				t.commit();
				session.flush();
				session.close();
				return null;
			}
		});
	}

	
}
