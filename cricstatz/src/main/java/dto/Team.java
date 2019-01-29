package dto;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table (name="Team")
public class Team {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private long teamId;
	private String emailId;
	private String password;	
	private String teamName;
	private String teamStatus;
	private double currentRunrate;
	private long tournamentId;
	//@Future
	private Date matchDate;
	private String teamInningStatus;
	private int totalMatches;
	private String totalMatchResults;
	private double netRunRate;
	private long teamScore;
	private int totalWickets;
	private double totalBalls;
	public int getTotalWickets() {
		return totalWickets;
	}

	public void setTotalWickets(int totalWickets) {
		this.totalWickets = totalWickets;
	}

	public double getTotalBalls() {
		return totalBalls;
	}

	public void setTotalBalls(double totalBalls) {
		this.totalBalls = totalBalls;
	}

	public Team() {
		super();
	}
	
	public Team(long teamId) {
		super();
		this.teamId = teamId;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTeamStatus() {
		return teamStatus;
	}

	public void setTeamStatus(String teamStatus) {
		this.teamStatus = teamStatus;
	}


	

	public Team(long teamId, String emailId, String password, String teamName, String teamStatus, double currentRunrate,
			long tournamentId, Date matchDate, String teamInningStatus, int totalMatches, String totalMatchResults,
			double netRunRate, long teamScore, int totalWickets, int totalBalls) {
		super();
		this.teamId = teamId;
		this.emailId = emailId;
		this.password = password;
		this.teamName = teamName;
		this.teamStatus = teamStatus;
		this.currentRunrate = currentRunrate;
		this.tournamentId = tournamentId;
		this.matchDate = matchDate;
		this.teamInningStatus = teamInningStatus;
		this.totalMatches = totalMatches;
		this.totalMatchResults = totalMatchResults;
		this.netRunRate = netRunRate;
		this.teamScore = teamScore;
		this.totalWickets = totalWickets;
		this.totalBalls = totalBalls;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public long getTeamId() {
		return teamId;
	}

	public void setTeamId(long teamId) {
		this.teamId = teamId;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public String getStatus() {
		return teamStatus;
	}

	public void setStatus(String status) {
		this.teamStatus = status;
	}

	public double getCurrentRunrate() {
		return currentRunrate;
	}

	public void setCurrentRunrate(double currentRunrate) {
		this.currentRunrate = currentRunrate;
	}

	public long getTournamentId() {
		return tournamentId;
	}

	public void setTournamentId(long tournamentId) {
		this.tournamentId = tournamentId;
	}

	public Date getMatchDate() {
		return matchDate;
	}

	public void setMatchDate(Date matchDate) {
		this.matchDate = matchDate;
	}

	public String getTeamInningStatus() {
		return teamInningStatus;
	}

	public void setTeamInningStatus(String teamInningStatus) {
		this.teamInningStatus = teamInningStatus;
	}

	public int getTotalMatches() {
		return totalMatches;
	}

	public void setTotalMatches(int totalMatches) {
		this.totalMatches = totalMatches;
	}

	public String getTotalMatchResults() {
		return totalMatchResults;
	}

	public void setTotalMatchResults(String totalMatchResults) {
		this.totalMatchResults = totalMatchResults;
	}

	public double getNetRunRate() {
		return netRunRate;
	}

	public void setNetRunRate(double netRunRate) {
		this.netRunRate = netRunRate;
	}

	public long getTeamScore() {
		return teamScore;
	}

	public void setTeamScore(long teamScore) {
		this.teamScore = teamScore;
	}

	@Override
	public String toString() {
		return "Team [teamId=" + teamId + ", emailId=" + emailId + ", password=" + password + ", teamName=" + teamName
				+ ", teamStatus=" + teamStatus + ", currentRunrate=" + currentRunrate + ", tournamentId=" + tournamentId
				+ ", matchDate=" + matchDate + ", teamInningStatus=" + teamInningStatus + ", totalMatches="
				+ totalMatches + ", totalMatchResults=" + totalMatchResults + ", netRunRate=" + netRunRate
				+ ", teamScore=" + teamScore + ", totalWickets=" + totalWickets + ", totalBalls=" + totalBalls + "]";
	}

	
	
	
	
	

}
