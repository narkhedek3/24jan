package dto;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table (name="PointTable")
public class PointTable {


	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private long pointtId;
	private long tournamentId;
	
	public PointTable(long pointtId, long tournamentId)
	{
		super();
		this.pointtId = pointtId;
		this.tournamentId = tournamentId;
	}
	
	
	public PointTable() {
		super();
	}


	public PointTable(long pointtId) {
		super();
		this.pointtId = pointtId;
	}


	public long getPointtId() {
	return pointtId;
	}	

	public void setPointtId(long pointtId) {
		this.pointtId = pointtId;
	}
	public long getTournamentId() {
		return tournamentId;
	}
	public void setTournamentId(long tournamentId) {
		this.tournamentId = tournamentId;
	}
}

