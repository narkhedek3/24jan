package dto;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table (name="Player")
public class Player {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private long playerId;
	private String playerName;
	private long teamId;
	private boolean battingStatus;
	private int playerTotalRuns;
	private double playerAverage;
	private boolean inPlaying_11;
	private int playerCurrentScore;
	private int currentMatch_4s;
	private int total_4s;
	private int currentMatch_6s;
	private int total_6s;
	private int currentMatchWickets;
	private int totalWickets;
	private boolean currentBatsMan;
	private boolean currentBowler;
	private int currentBallsByBowler;
	private int bowlerTotalRuns;
	private int batsmanCurrentBalls;
	
	public Player() {
		super();
	}

	public Player(long playerId) {
		super();
		this.playerId = playerId;
	}

	public Player(long playerId, String playerName, long teamId, boolean battingStatus, int playerTotalRuns,
			double playerAverage, boolean inPlaying_11, int playerCurrentScore, int currentMatch_4s, int total_4s,
			int currentMatch_6s, int total_6s, int currentMatchWickets, int totalWickets, boolean currentBatsMan,
			boolean currentBowler, int currentBallsByBowler, int bowlerTotalRuns, int batsmanCurrentBalls) {
		super();
		this.playerId = playerId;
		this.playerName = playerName;
		this.teamId = teamId;
		this.battingStatus = battingStatus;
		this.playerTotalRuns = playerTotalRuns;
		this.playerAverage = playerAverage;
		this.inPlaying_11 = inPlaying_11;
		this.playerCurrentScore = playerCurrentScore;
		this.currentMatch_4s = currentMatch_4s;
		this.total_4s = total_4s;
		this.currentMatch_6s = currentMatch_6s;
		this.total_6s = total_6s;
		this.currentMatchWickets = currentMatchWickets;
		this.totalWickets = totalWickets;
		this.currentBatsMan = currentBatsMan;
		this.currentBowler = currentBowler;
		this.currentBallsByBowler = currentBallsByBowler;
		this.bowlerTotalRuns = bowlerTotalRuns;
		this.batsmanCurrentBalls = batsmanCurrentBalls;
	}

	public long getPlayerId() {
		return playerId;
	}

	public void setPlayerId(long playerId) {
		this.playerId = playerId;
	}

	public String getPlayerName() {
		return playerName;
	}

	public void setPlayerName(String playerName) {
		this.playerName = playerName;
	}

	public long getTeamId() {
		return teamId;
	}

	public void setTeamId(long teamId) {
		this.teamId = teamId;
	}

	public boolean isBattingStatus() {
		return battingStatus;
	}

	public void setBattingStatus(boolean battingStatus) {
		this.battingStatus = battingStatus;
	}

	public int getPlayerTotalRuns() {
		return playerTotalRuns;
	}

	public void setPlayerTotalRuns(int playerTotalRuns) {
		this.playerTotalRuns = playerTotalRuns;
	}

	public double getPlayerAverage() {
		return playerAverage;
	}

	public void setPlayerAverage(double playerAverage) {
		this.playerAverage = playerAverage;
	}

	public boolean isInPlaying_11() {
		return inPlaying_11;
	}

	public void setInPlaying_11(boolean inPlaying_11) {
		this.inPlaying_11 = inPlaying_11;
	}

	public int getPlayerCurrentScore() {
		return playerCurrentScore;
	}

	public void setPlayerCurrentScore(int playerCurrentScore) {
		this.playerCurrentScore = playerCurrentScore;
	}

	public int getCurrentMatch_4s() {
		return currentMatch_4s;
	}

	public void setCurrentMatch_4s(int currentMatch_4s) {
		this.currentMatch_4s = currentMatch_4s;
	}

	public int getTotal_4s() {
		return total_4s;
	}

	public void setTotal_4s(int total_4s) {
		this.total_4s = total_4s;
	}

	public int getCurrentMatch_6s() {
		return currentMatch_6s;
	}

	public void setCurrentMatch_6s(int currentMatch_6s) {
		this.currentMatch_6s = currentMatch_6s;
	}

	public int getTotal_6s() {
		return total_6s;
	}

	public void setTotal_6s(int total_6s) {
		this.total_6s = total_6s;
	}

	public int getCurrentMatchWickets() {
		return currentMatchWickets;
	}

	public void setCurrentMatchWickets(int currentMatchWickets) {
		this.currentMatchWickets = currentMatchWickets;
	}

	public int getTotalWickets() {
		return totalWickets;
	}

	public void setTotalWickets(int totalWickets) {
		this.totalWickets = totalWickets;
	}

	public boolean isCurrentBatsMan() {
		return currentBatsMan;
	}

	public void setCurrentBatsMan(boolean currentBatsMan) {
		this.currentBatsMan = currentBatsMan;
	}

	public boolean isCurrentBowler() {
		return currentBowler;
	}

	public void setCurrentBowler(boolean currentBowler) {
		this.currentBowler = currentBowler;
	}

	public int getCurrentBallsByBowler() {
		return currentBallsByBowler;
	}

	public void setCurrentBallsByBowler(int currentBallsByBowler) {
		this.currentBallsByBowler = currentBallsByBowler;
	}

	public int getBowlerTotalRuns() {
		return bowlerTotalRuns;
	}

	public void setBowlerTotalRuns(int bowlerTotalRuns) {
		this.bowlerTotalRuns = bowlerTotalRuns;
	}

	public int getBatsmanCurrentBalls() {
		return batsmanCurrentBalls;
	}

	public void setBatsmanCurrentBalls(int batsmanCurrentBalls) {
		this.batsmanCurrentBalls = batsmanCurrentBalls;
	}

	@Override
	public String toString() {
		return "Player [playerId=" + playerId + ", playerName=" + playerName + ", teamId=" + teamId + ", battingStatus="
				+ battingStatus + ", playerTotalRuns=" + playerTotalRuns + ", playerAverage=" + playerAverage
				+ ", inPlaying_11=" + inPlaying_11 + ", playerCurrentScore=" + playerCurrentScore + ", currentMatch_4s="
				+ currentMatch_4s + ", total_4s=" + total_4s + ", currentMatch_6s=" + currentMatch_6s + ", total_6s="
				+ total_6s + ", currentMatchWickets=" + currentMatchWickets + ", totalWickets=" + totalWickets
				+ ", currentBatsMan=" + currentBatsMan + ", currentBowler=" + currentBowler + ", currentBallsByBowler="
				+ currentBallsByBowler + ", bowlerTotalRuns=" + bowlerTotalRuns + ", batsmanCurrentBalls="
				+ batsmanCurrentBalls + "]";
	}
	
	
	
}
