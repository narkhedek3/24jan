package dto;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table (name="MatchDetails")
public class MatchDetails{
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private long matchId;
	private Date matchDate;
	private long team1Id;
	private long team2Id;
	private long scheduleId;
	private long roundNo;
	public long getMatchId() {
		return matchId;
	}
	public MatchDetails(long matchId, Date matchDate, long team1Id, long team2Id, long scheduleId, long roundNo) {
		super();
		this.matchId = matchId;
		this.matchDate = matchDate;
		this.team1Id = team1Id;
		this.team2Id = team2Id;
		this.scheduleId = scheduleId;
		this.roundNo = roundNo;
	}
	
	public MatchDetails(long matchId) {
		super();
		this.matchId = matchId;
	}
	
	public MatchDetails() {
		super();
	}
	public void setMatchId(long matchId) {
		this.matchId = matchId;
	}
	public Date getMatchDate() {
		return matchDate;
	}
	public void setMatchDate(Date matchDate) {
		this.matchDate = matchDate;
	}
	public long getTeam1Id() {
		return team1Id;
	}
	public void setTeam1Id(long team1Id) {
		this.team1Id = team1Id;
	}
	public long getTeam2Id() {
		return team2Id;
	}
	public void setTeam2Id(long team2Id) {
		this.team2Id = team2Id;
	}
	public long getScheduleId() {
		return scheduleId;
	}
	public void setScheduleId(long scheduleId) {
		this.scheduleId = scheduleId;
	}
	public long getRoundNo() {
		return roundNo;
	}
	public void setRoundNo(long roundNo) {
		this.roundNo = roundNo;
	}
	
}
