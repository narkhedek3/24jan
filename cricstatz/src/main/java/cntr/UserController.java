package cntr;

import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sound.midi.Soundbank;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.PlayerDao;
import dao.TeamDao;
import dao.TournamentsDao;
import dao.UserDao;
import dto.Player;
import dto.Team;
import dto.Tournament;
import dto.User;


@Controller
public class UserController {

	@Autowired
	private TournamentsDao tournamentsDao;
	@Autowired
	private TeamDao teamDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private PlayerDao playerDao;
	
	
	

	public PlayerDao getPlayerDao() {
		return playerDao;
	}

	public void setPlayerDao(PlayerDao playerDao) {
		this.playerDao = playerDao;
	}

	public void setTournamentsDao(TournamentsDao tournamentsDao) {
		this.tournamentsDao = tournamentsDao;
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public TeamDao getTeamDao() {
		return teamDao;
	}

	public void setTeamDao(TeamDao teamDao) {
		this.teamDao = teamDao;
	}

	public TournamentsDao getTournamentsDao() {
		return tournamentsDao;
	}

	public void setUserDao(TournamentsDao tournamentsDao) {
		this.tournamentsDao = tournamentsDao;
	}

	@RequestMapping(value="/index.htm")
	public String showindex() {

		return "index";
	}
	
	@RequestMapping(value="/teamProfile.htm")
	public String showTeamProfile(ModelMap model,HttpSession session) {
		User user = (User)session.getAttribute("user");		
		Team specificTeam = teamDao.getTeam(user);
		session.setAttribute("playerList", playerDao.selectPlayerWithTeamId(specificTeam));
		model.put("team", specificTeam);
		return "teamProfile";
	}
	
	@RequestMapping(value="/tournamentProfile.htm")
	public String showTournamnetProfile(ModelMap model,HttpSession session) {
		User user = (User)session.getAttribute("user");		
		Tournament specificTournament = tournamentsDao.getTournament(user); 
		model.put("tournament", specificTournament);
		return "tournamentProfile";
	}
	
	@RequestMapping(value="/loginPage.htm")
	public String loginform(ModelMap model) {
		model.put("user", new User());
		return "loginPage";
	}
	
	@RequestMapping(value="/signUpPage.htm")
	public String SignUpform(ModelMap model) {
		model.put("user", new User());
		return "signUpPage";
	}
	
	@RequestMapping(value="/signup.htm")
	public String CreateUser(final User user,  ModelMap model) {
		
		try
		{
		
			User tempUser = userDao.selectUser(user.getEmailId());
			if(tempUser.getEmailId().equals(user.getEmailId()))
			{
				model.put("msg", "Duplicate");
				return "signUpPage";
			}
		
		
		}
		catch(Exception e)
		{
		
		//validation
		
		userDao.createUser(user);
		
		}
		
		return "loginPage";
	}
	
	
	@RequestMapping(value="/loginStatus.htm")
	public String validateUser(final User user,ModelMap model,HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		try
		{
			List<User> list = userDao.login(user);
			if( list.isEmpty() )
			{
				model.put("user", user);
				return "loginPage";
			}
			
			for(User u : list) 
			{
				if(u.getUserRole().equals("Tournament Representative"))
				{				
					session.setAttribute("user", u);				
					Tournament specificTournament = tournamentsDao.getTournament(u);					
					if(specificTournament==null)
					{
						try {						
							response.sendRedirect("preTournamentsRegistration.htm");						
						} catch (IOException e) {						
							e.printStackTrace();
						}
					}	
					model.put("tournament", specificTournament);	
					
					response.sendRedirect("tournamentProfile.htm");
					
					
				}
				else {				
					session.setAttribute("user", u);
					
					Team specificTeam = teamDao.getTeam(u);					
					
					if(specificTeam==null) {					
							response.sendRedirect("preTeamForm.htm");					
					}
					else {
						response.sendRedirect("teamProfile.htm");
					}

				}
			}
		}catch(Exception exp){
			return "errorPage";
		}	
		
		return "loginPage";
		
	}
	
	
	@RequestMapping(value="/signOut.htm")
	public void signout(HttpSession session,HttpServletRequest request, HttpServletResponse response) {
		session.invalidate(); 
		request.getSession(true);
		try {
			response.sendRedirect(request.getContextPath() + "/index.htm");			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}	


	
	
	@RequestMapping(value="/livescores.htm")
	public String showLiveScores() {

		return "livescores";
	}

	@RequestMapping(value="/preTournamentsRegistration.htm")
	public String showregister(ModelMap model) {
		model.put("tournament", new Tournament()); 
		return "tournamentsRegistration";
	}

	@RequestMapping(value="/postTournamentsRegistraion.htm")
	public String showtournaments(Tournament tournament , ModelMap model) {
		tournamentsDao.createTournament(tournament);
		model.put("tournamnet",tournament);
		return "tournamentProfile";
	}

	@RequestMapping(value="/tournaments.htm")
	public String showTournamentList(ModelMap model) {
		List<Tournament> tournamentList = tournamentsDao.selectTournaments();
		model.put("tournamentList",tournamentList);
		return "tournaments";
	}
	
	@RequestMapping(value="/playersList.htm")
	public String showplayersList(ModelMap model) {
		List<Team> teamList = teamDao.selectTeam();
		model.put("teamList", teamList);
		return "playersList";
	}
	
	@RequestMapping(value="/playerForm.htm")
	public String showplayerForm(ModelMap model,HttpSession session) {
		
		User user = (User)session.getAttribute("user");
		Team specificTeam = teamDao.getTeam(user);
		Player player  = new Player();
		player.setTeamId(specificTeam.getTeamId());
		model.put("player", player);
		return "playerForm";
	}
	
	@RequestMapping(value="/createPlayer.htm")
	public String createplayer(Player player,HttpSession session , ModelMap model,HttpServletResponse response) {
		User user = (User)session.getAttribute("user");		
		Team specificTeam = teamDao.getTeam(user);
		session.setAttribute("playerList", playerDao.selectPlayerWithTeamId(specificTeam));
		model.put("team", specificTeam);
		playerDao.createPlayer(player);
		try {
			response.sendRedirect("teamProfile.htm");
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		return "teamProfile";
	}
	
	
	
	@RequestMapping(value="/preTeamForm.htm")
	public String showTeamForm(ModelMap model) {
		model.put("team", new Team());
		return "teamForm";
	}
	
	@RequestMapping(value="/postTeamForm.htm")
	public String TeamFormSuccess(Team team,ModelMap model) {
		teamDao.createTeam(team);
		model.put("team", team);
		return "teamProfile";
	}
	
	@RequestMapping(value="/teamList.htm")
	public String showteamList(ModelMap model) {
		List<Team> teamList = teamDao.selectTeam();
		model.put("teamList", teamList);
		return "teamList";
	}
	
	@RequestMapping(value="/viewScoreCard.htm")
	public String showScoreCard() {

		return "scoreCard";
	}
	
	@RequestMapping(value="/about.htm")
	public String showabout() {

		return "about";
	}

}