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
	private String playerStatus;
	private double playerTotalRuns;
	private double playerAverage;
	private boolean inPlaying_11;
	private double playerCurrentScore;
	private double currentMatch_4s;
	private double total_4s;
	private double currentMatch_6s;
	private double total_6s;
	private double currentMatchWickets;
	private double totalWickets;
	private boolean currentBatsMan;
	private boolean currentBowler;
	private double currentBallsByBowler;
	private double bowlerCurrentRuns;
	private double bowlerTotalRuns;
	private double batsmanCurrentBalls;
	private String playerImage; 
	
	public Player() {
		super();
	}

	public Player(long playerId) {
		super();
		this.playerId = playerId;
	}

	

	
	public Player(long playerId, String playerName, long teamId, String playerStatus, double playerTotalRuns,
			double playerAverage, boolean inPlaying_11, double playerCurrentScore, double currentMatch_4s, double total_4s,
			double currentMatch_6s, double total_6s, double currentMatchWickets, double totalWickets, boolean currentBatsMan,
			boolean currentBowler, double currentBallsByBowler, double bowlerCurrentRuns, double bowlerTotalRuns,
			double batsmanCurrentBalls, String playerImage) {
		super();
		this.playerId = playerId;
		this.playerName = playerName;
		this.teamId = teamId;
		this.playerStatus = playerStatus;
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
		this.bowlerCurrentRuns = bowlerCurrentRuns;
		this.bowlerTotalRuns = bowlerTotalRuns;
		this.batsmanCurrentBalls = batsmanCurrentBalls;
		this.playerImage = playerImage;
	}

	public double getBowlerCurrentRuns() {
		return bowlerCurrentRuns;
	}

	public void setBowlerCurrentRuns(double bowlerCurrentRuns) {
		this.bowlerCurrentRuns = bowlerCurrentRuns;
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

	public String getPlayerStatus() {
		return playerStatus;
	}

	public void setPlayerStatus(String playerStatus) {
		this.playerStatus = playerStatus;
	}

	public double getPlayerTotalRuns() {
		return playerTotalRuns;
	}

	public void setPlayerTotalRuns(double playerTotalRuns) {
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

	public double getPlayerCurrentScore() {
		return playerCurrentScore;
	}

	public void setPlayerCurrentScore(double playerCurrentScore) {
		this.playerCurrentScore = playerCurrentScore;
	}

	public double getCurrentMatch_4s() {
		return currentMatch_4s;
	}

	public void setCurrentMatch_4s(double currentMatch_4s) {
		this.currentMatch_4s = currentMatch_4s;
	}

	public double getTotal_4s() {
		return total_4s;
	}

	public void setTotal_4s(double total_4s) {
		this.total_4s = total_4s;
	}

	public double getCurrentMatch_6s() {
		return currentMatch_6s;
	}

	public void setCurrentMatch_6s(double currentMatch_6s) {
		this.currentMatch_6s = currentMatch_6s;
	}

	public double getTotal_6s() {
		return total_6s;
	}

	public void setTotal_6s(double total_6s) {
		this.total_6s = total_6s;
	}

	public double getCurrentMatchWickets() {
		return currentMatchWickets;
	}

	public void setCurrentMatchWickets(double currentMatchWickets) {
		this.currentMatchWickets = currentMatchWickets;
	}

	public double getTotalWickets() {
		return totalWickets;
	}

	public void setTotalWickets(double totalWickets) {
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

	public double getCurrentBallsByBowler() {
		return currentBallsByBowler;
	}

	public void setCurrentBallsByBowler(double currentBallsByBowler) {
		this.currentBallsByBowler = currentBallsByBowler;
	}

	public double getBowlerTotalRuns() {
		return bowlerTotalRuns;
	}

	public void setBowlerTotalRuns(double bowlerTotalRuns) {
		this.bowlerTotalRuns = bowlerTotalRuns;
	}

	public double getBatsmanCurrentBalls() {
		return batsmanCurrentBalls;
	}

	public void setBatsmanCurrentBalls(double batsmanCurrentBalls) {
		this.batsmanCurrentBalls = batsmanCurrentBalls;
	}
	

	public String getPlayerImage() {
		return playerImage;
	}

	public void setPlayerImage(String playerImage) {
		this.playerImage = playerImage;
	}

	@Override
	public String toString() {
		return "Player [playerId=" + playerId + ", playerName=" + playerName + ", teamId=" + teamId + ", playerStatus="
				+ playerStatus + ", playerTotalRuns=" + playerTotalRuns + ", playerAverage=" + playerAverage
				+ ", inPlaying_11=" + inPlaying_11 + ", playerCurrentScore=" + playerCurrentScore + ", currentMatch_4s="
				+ currentMatch_4s + ", total_4s=" + total_4s + ", currentMatch_6s=" + currentMatch_6s + ", total_6s="
				+ total_6s + ", currentMatchWickets=" + currentMatchWickets + ", totalWickets=" + totalWickets
				+ ", currentBatsMan=" + currentBatsMan + ", currentBowler=" + currentBowler + ", currentBallsByBowler="
				+ currentBallsByBowler + ", bowlerCurrentRuns=" + bowlerCurrentRuns + ", bowlerTotalRuns="
				+ bowlerTotalRuns + ", batsmanCurrentBalls=" + batsmanCurrentBalls + ", playerImage=" + playerImage
				+ "]";
	}

	
	
	
	
	
}
