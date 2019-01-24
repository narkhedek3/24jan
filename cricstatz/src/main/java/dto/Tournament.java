package dto;





import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="Tournament")
public class Tournament {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private long tournamentId;
	private String emailId;
	private String tournamentName;
	//@Temporal(TemporalType.DATE)
	private String registrationStartDate;
	private String registrationEndDate;
	private String tournamentStartDate;
	private String tournamentEndDate;
	private int numberOfTeams;
	private int entryFee;
	private int winningPrize;
	private String location;
	private String address;
	
	public Tournament() {
		super();
	}

	public Tournament(long tournamentId) {
		super();
		this.tournamentId = tournamentId;
	}

	

	public Tournament(long tournamentId, String emailId, String tournamentName, String registrationStartDate,
			String registrationEndDate, String tournamentStartDate, String tournamentEndDate, int numberOfTeams, int entryFee,
			int winningPrize, String location, String address) {
		super();
		this.tournamentId = tournamentId;
		this.emailId = emailId;
		this.tournamentName = tournamentName;
		this.registrationStartDate = registrationStartDate;
		this.registrationEndDate = registrationEndDate;
		this.tournamentStartDate = tournamentStartDate;
		this.tournamentEndDate = tournamentEndDate;
		this.numberOfTeams = numberOfTeams;
		this.entryFee = entryFee;
		this.winningPrize = winningPrize;
		this.location = location;
		this.address = address;
	}

	public long getTournamentId() {
		return tournamentId;
	}

	public void setTournamentId(long tournamentId) {
		this.tournamentId = tournamentId;
	}

	public String getTournamentName() {
		return tournamentName;
	}

	public void setTournamentName(String tournamentName) {
		this.tournamentName = tournamentName;
	}

	public String getRegistrationStartDate() {
		return registrationStartDate;
	}

	public void setRegistrationStartDate(String registrationStartDate) {
		this.registrationStartDate = registrationStartDate;
	}

	public String getRegistrationEndDate() {
		return registrationEndDate;
	}

	public void setRegistrationEndDate(String registrationEndDate) {
		this.registrationEndDate = registrationEndDate;
	}

	public String getTournamentStartDate() {
		return tournamentStartDate;
	}

	public void setTournamentStartDate(String tournamentStartDate) {
		this.tournamentStartDate = tournamentStartDate;
	}

	public String getTournamentEndDate() {
		return tournamentEndDate;
	}

	public void setTournamentEndDate(String tournamentEndDate) {
		this.tournamentEndDate = tournamentEndDate;
	}

	public int getNumberOfTeams() {
		return numberOfTeams;
	}

	public void setNumberOfTeams(int noOfTeams) {
		this.numberOfTeams = noOfTeams;
	}

	public int getEntryFee() {
		return entryFee;
	}

	public void setEntryFee(int entryFee) {
		this.entryFee = entryFee;
	}

	public int getWinningPrize() {
		return winningPrize;
	}

	public void setWinningPrize(int winningPrize) {
		this.winningPrize = winningPrize;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	@Override
	public String toString() {
		return "Tournament [tournamentId=" + tournamentId + ", emailId=" + emailId + ", tournamentName="
				+ tournamentName + ", registrationStartDate=" + registrationStartDate + ", registrationEndDate="
				+ registrationEndDate + ", tournamentStartDate=" + tournamentStartDate + ", tournamentEndDate="
				+ tournamentEndDate + ", numberOfTeams=" + numberOfTeams + ", entryFee=" + entryFee + ", winningPrize="
				+ winningPrize + ", location=" + location + ", address=" + address + "]";
	}
	
	
	
}
