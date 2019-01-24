package dto;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ScheduleTable")
public class ScheduleTable {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)	
	private long tournamentId;
	private long scheduleId;


public ScheduleTable(long tournamentId, long scheduleId) {
	super();
	this.tournamentId = tournamentId;
	this.scheduleId = scheduleId;
}

public ScheduleTable() {
	super();
}

public ScheduleTable(long scheduleId) {
	super();
	this.scheduleId = scheduleId;
}

public long getTournamentId() {
	return tournamentId;
}

public void setTournamentId(long tournamentId) {
	this.tournamentId = tournamentId;
}

public long getScheduleId() {
	return scheduleId;
}

public void setScheduleId(long scheduleId) {
	this.scheduleId = scheduleId;
}

}