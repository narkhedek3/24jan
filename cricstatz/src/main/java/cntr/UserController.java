package cntr;

import java.io.IOException;
import java.lang.annotation.Annotation;
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
import org.springframework.web.bind.annotation.ResponseBody;

import dao.PlayerDao;
import dao.TeamDao;
import dao.TournamentsDao;
import dao.UserDao;
import dto.Player;
import dto.Team;
import dto.Tournament;
import dto.User;
import dto.MatchDetails;



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
		if(user!=null && user.getUserRole().equals("Team Representative"))
		{	
			
		Team specificTeam = teamDao.getTeam(user);
		session.setAttribute("playerList", playerDao.selectPlayerWithTeamId(specificTeam));
		model.put("team", specificTeam);
		return "teamProfile";
		}
		model.put("user", new User());
		return "loginPage";
	}

	@RequestMapping(value="/tournamentProfile.htm")
	public String showTournamnetProfile(ModelMap model,HttpSession session) {
		
		User user = (User)session.getAttribute("user");		
		if(user!=null && user.getUserRole().equals("Tournament Representative"))
		{
		Tournament specificTournament = tournamentsDao.getTournament(user); 
		
		List<Team> teamList = tournamentsDao.getRegisteredTeams(specificTournament);
		System.out.println(teamList+"++++++++++++++");
		model.addAttribute("tournament", specificTournament);
		model.put("match", new MatchDetails());
		session.setAttribute("teamList", teamList);
		return "tournamentProfile";
		}
		model.put("user", new User());
		return "loginPage";
		
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
	
	@RequestMapping(value="/teamSelection.htm")
	public String teamSelect(MatchDetails match,ModelMap model) {
		model.addAttribute("match",match);
		return "scoreUpdater";
	}

	@RequestMapping(value="/postTournamentsRegistraion.htm")
	public String showtournaments(Tournament tournament , ModelMap model,HttpServletResponse response,HttpSession session) {
		tournamentsDao.createTournament(tournament);
		
		
		User user = (User)session.getAttribute("user");		
		Tournament specificTournament = tournamentsDao.getTournament(user); 
		
		List<Team> teamList = tournamentsDao.getRegisteredTeams(specificTournament);
		System.out.println(teamList+"++++++++++++++");
		model.addAttribute("tournament", specificTournament);
		model.put("match", new MatchDetails());
		session.setAttribute("teamList", teamList);
		
		
		try {
			response.sendRedirect("tournamentProfile.htm");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "tournamentProfile";
	}

	
	@RequestMapping(value="/tournamentEditModal.htm")
	public String tournamentEditModal(ModelMap model,Tournament tournament,HttpSession session,HttpServletResponse response) {
		System.out.println(tournament+"*--*-**-*-*-*-*-*-**-***-**-*-*-**-*-");
		tournamentsDao.updateTournament(tournament);
		
		User user = (User)session.getAttribute("user");		
		Tournament specificTournament = tournamentsDao.getTournament(user); 
		
		List<Team> teamList = tournamentsDao.getRegisteredTeams(specificTournament);
		System.out.println(teamList+"++++++++++++++");
		model.addAttribute("tournament", specificTournament);
		model.put("match", new MatchDetails());
		session.setAttribute("teamList", teamList);
		try {
			response.sendRedirect("tournamentProfile.htm");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "tournamentProfile";
	}
	
	
	@RequestMapping(value="/tournaments.htm")
	public String showTournamentList(ModelMap model,HttpSession session,HttpServletResponse response,HttpServletRequest request) {
		List<Tournament> tournamentList = tournamentsDao.selectTournaments();
		if(session.getAttribute("user")!=null)
		{
			User user = (User)session.getAttribute("user");		
			Team currentTeam = teamDao.getTeam(user);
			System.out.println(currentTeam+"*+**+*+*+*+*++*+*+*+**++**+*");
			model.addAttribute("teams", currentTeam);
			model.addAttribute("currentUser",session.getAttribute("user"));
			model.addAttribute("userRole",user.getUserRole());
			model.addAttribute("tournament",new Tournament());
			model.addAttribute("tournamentList",tournamentList);
			
			return "tournaments";

		}
				
		model.addAttribute("teams", new Team());
		model.addAttribute("tournamentList",tournamentList);		
		return "tournaments";
	}
	
	

	@RequestMapping(value="/playersList.htm")
	public String showplayersList(ModelMap model,HttpSession session) {
		model.addAttribute("playerList", playerDao.selectAllPlayer());
		System.out.println(playerDao.selectAllPlayer()+" contr----------------------");
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
	public String TeamFormSuccess(Team team,ModelMap model,HttpSession session,HttpServletResponse response) {
		teamDao.createTeam(team);
		
		
		User user = (User)session.getAttribute("user");		
		Team specificTeam = teamDao.getTeam(user);
		session.setAttribute("playerList", playerDao.selectPlayerWithTeamId(specificTeam));
		model.put("team", specificTeam);
		
		try {
			response.sendRedirect("teamProfile.htm");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "teamProfile";
	}

	@RequestMapping(value="/teamList.htm")
	public String showteamList(ModelMap model) {
		List<Team> teamList = teamDao.selectTeam();
		model.put("teamList", teamList);
		return "teamList";
	}


	@RequestMapping(value="/teamRegistration.htm")
	public String teamRegistration(Tournament tournament,HttpServletResponse response,HttpSession session,HttpServletRequest request) {
		
		try {
			
			
			System.out.println(tournament+"********************************************");
			User user = (User)session.getAttribute("user");
			Team currentTeam = teamDao.getTeam(user);
			currentTeam.setTournamentId(tournament.getTournamentId());
			teamDao.updateTeam(currentTeam);
			
			response.sendRedirect("tournaments.htm");
		} catch (Exception e) {

			e.printStackTrace();
		}
		return "tournaments";
	}

	@RequestMapping(value="/viewScoreCard.htm")
	public String showScoreCard() {

		return "scoreCard";
	}

	@RequestMapping(value="/about.htm")
	public String showabout() {

		return "about";
	}
	
	
	
	/*
	 * @RequestMapping(value="/ajax.htm")
	 * 
	 * @ResponseBody public ResponseBody showAjax() { ResponseBody responseBody =
	 * new ResponseBody() {
	 * 
	 * @Override public Class<? extends Annotation> annotationType() { // TODO
	 * Auto-generated method stub return null; } }; return "scoreCard"; }
	 */

	
	

}