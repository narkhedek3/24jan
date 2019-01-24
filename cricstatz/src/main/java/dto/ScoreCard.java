package dto;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table (name="ScoreCard")
public class ScoreCard {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private long scoreCardId;
	private long matchId;
	private long teamId;
	private String team1Status;
	private String team2Status;




	public ScoreCard(long scoreCardId, long matchId, long teamId, String team1Status, String team2Status) {
		super();
		this.scoreCardId = scoreCardId;
		this.matchId = matchId;
		this.teamId = teamId;
		this.team1Status = team1Status;
		this.team2Status = team2Status;
	}

	public ScoreCard() {
		super();
	}

	public ScoreCard(long scoreCardId) {
		super();
		this.scoreCardId = scoreCardId;
	}

	public long getScoreCardId() {
		return scoreCardId;
	}

	public void setScoreCardId(long scoreCardId) {
		this.scoreCardId = scoreCardId;
	}

	public long getMatchId() {
		return matchId;
	}

	public void setMatchId(long matchId) {
		this.matchId = matchId;
	}

	public long getTeamId() {
		return teamId;
	}

	public void setTeamId(long teamId) {
		this.teamId = teamId;
	}

	public String getTeam1Status() {
		return team1Status;
	}

	public void setTeam1Status(String team1Status) {
		this.team1Status = team1Status;
	}

	public String getTeam2Status() {
		return team2Status;
	}

	public void setTeam2Status(String team2Status) {
		this.team2Status = team2Status;
	}

	@Override
	public String toString() {
		return "ScoreCard [scoreCardId=" + scoreCardId + ", matchId=" + matchId + ", teamId=" + teamId
				+ ", team1Status=" + team1Status + ", team2Status=" + team2Status + "]";
	}
}

