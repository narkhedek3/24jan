package cntr;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.annotation.Annotation;
import java.util.LinkedHashMap;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.sun.javafx.collections.MappingChange.Map;

import dao.MatchDetailsDao;
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
	@Autowired
	private MatchDetailsDao matchDetailsDao;

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

	@RequestMapping(value = "/index.htm")
	public String showindex() {

		return "index";
	}

	@RequestMapping(value = "/teamProfile.htm")
	public String showTeamProfile(ModelMap model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user != null && user.getUserRole().equals("Team Representative")) {

			Team specificTeam = teamDao.getTeam(user);
			session.setAttribute("playerList", playerDao.selectPlayerWithTeamId(specificTeam));
			model.put("team", specificTeam);
			return "teamProfile";
		}
		model.put("user", new User());
		return "loginPage";
	}

	@RequestMapping(value = "/tournamentProfile.htm")
	public String showTournamnetProfile(ModelMap model, HttpSession session) {

		User user = (User) session.getAttribute("user");
		if (user != null && user.getUserRole().equals("Tournament Representative")) {
			Tournament specificTournament = tournamentsDao.getTournament(user);

			List<Team> teamList = tournamentsDao.getRegisteredTeams(specificTournament);
			
			model.addAttribute("tournament", specificTournament);
			model.put("match", new MatchDetails());
			session.setAttribute("teamList", teamList);
			return "tournamentProfile";
		}
		model.put("user", new User());
		return "loginPage";

	}

	@RequestMapping(value = "/loginPage.htm")
	public String loginform(ModelMap model) {
		model.put("user", new User());
		return "loginPage";
	}

	@RequestMapping(value = "/signUpPage.htm")
	public String SignUpform(ModelMap model) {
		model.put("user", new User());
		return "signUpPage";
	}

	@RequestMapping(value = "/signup.htm")
	public String CreateUser(final User user, ModelMap model) {

		try {

			User tempUser = userDao.selectUser(user.getEmailId());
			if (tempUser.getEmailId().equals(user.getEmailId())) {
				model.put("msg", "Duplicate");
				return "signUpPage";
			}

		} catch (Exception e) {

			// validation

			userDao.createUser(user);

		}

		return "loginPage";
	}

	@RequestMapping(value = "/loginStatus.htm")
	public String validateUser(final User user, ModelMap model, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) {
		try {
			List<User> list = userDao.login(user);
			if (list.isEmpty()) {
				model.put("user", user);
				return "loginPage";
			}

			for (User u : list) {
				if (u.getUserRole().equals("Tournament Representative")) {
					session.setAttribute("user", u);
					Tournament specificTournament = tournamentsDao.getTournament(u);
					if (specificTournament == null) {
						try {
							response.sendRedirect("preTournamentsRegistration.htm");
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
					model.put("tournament", specificTournament);

					response.sendRedirect("tournamentProfile.htm");

				} else {
					session.setAttribute("user", u);

					Team specificTeam = teamDao.getTeam(u);

					if (specificTeam == null) {
						response.sendRedirect("preTeamForm.htm");
					} else {
						response.sendRedirect("teamProfile.htm");
					}

				}
			}
		} catch (Exception exp) {

		}

		return "loginPage";

	}

	@RequestMapping(value = "/signOut.htm")
	public void signout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		session.invalidate();
		request.getSession(true);
		try {
			response.sendRedirect(request.getContextPath() + "/index.htm");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/livescores.htm")
	public String showLiveScores() {

		return "livescores";
	}

	@RequestMapping(value = "/preTournamentsRegistration.htm")
	public String showregister(ModelMap model) {
		model.put("tournament", new Tournament());
		return "tournamentsRegistration";
	}

	@RequestMapping(value = "/teamSelection.htm")
	public String teamSelect(MatchDetails match, ModelMap model) {
		matchDetailsDao.createMatch(match);
		Team team1 =teamDao.selectTeam(match.getTeam1Id());
		Team team2 =teamDao.selectTeam(match.getTeam2Id());
		model.addAttribute("match", match);
		model.addAttribute("team1",teamDao.selectTeam(match.getTeam1Id()));	
		model.addAttribute("team2",teamDao.selectTeam(match.getTeam2Id()));
		model.addAttribute("playerTeam1List",  playerDao.selectPlayerWithTeamId(team1));
		model.addAttribute("playerTeam2List",  playerDao.selectPlayerWithTeamId(team2));
		return "scoreUpdater";
	}

	@RequestMapping(value = "/postTournamentsRegistraion.htm")
	public String showtournaments(Tournament tournament, ModelMap model, HttpServletResponse response,
			HttpSession session) {
		tournamentsDao.createTournament(tournament);

		User user = (User) session.getAttribute("user");
		Tournament specificTournament = tournamentsDao.getTournament(user);

		List<Team> teamList = tournamentsDao.getRegisteredTeams(specificTournament);
		
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

	@RequestMapping(value = "/tournamentEditModal.htm")
	public String tournamentEditModal(ModelMap model, Tournament tournament, HttpSession session,
			HttpServletResponse response) {
		
		tournamentsDao.updateTournament(tournament);

		User user = (User) session.getAttribute("user");
		Tournament specificTournament = tournamentsDao.getTournament(user);

		List<Team> teamList = tournamentsDao.getRegisteredTeams(specificTournament);
		
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
	
	@RequestMapping(value = "/teamEditModal.htm")
	public String teamEditModal(ModelMap model, Team team, HttpSession session,	HttpServletResponse response) {
		
		teamDao.updateTeam(team);

		User user = (User) session.getAttribute("user");
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
	

	@RequestMapping(value = "/tournaments.htm")
	public String showTournamentList(ModelMap model, HttpSession session, HttpServletResponse response,
			HttpServletRequest request) {
		List<Tournament> tournamentList = tournamentsDao.selectTournaments();
		if (session.getAttribute("user") != null) {
			User user = (User) session.getAttribute("user");
			Team currentTeam = teamDao.getTeam(user);
		
			if(currentTeam!=null)
			{
				model.addAttribute("teams", currentTeam);
			}
			else
				{
				model.addAttribute("teams", new Team());
				}
			model.addAttribute("currentUser", session.getAttribute("user"));
			model.addAttribute("userRole", user.getUserRole());
			model.addAttribute("tournament", new Tournament());
			model.addAttribute("tournamentList", tournamentList);

			return "tournaments";

		}

		model.addAttribute("teams", new Team());
		model.addAttribute("tournamentList", tournamentList);
		return "tournaments";
	}

	@RequestMapping(value = "/playersList.htm")
	public String showplayersList(ModelMap model, HttpSession session) {
		model.addAttribute("playerList", playerDao.selectAllPlayer());
		
		return "playersList";
	}

	@RequestMapping(value = "/playerForm.htm")
	public String showplayerForm(ModelMap model, HttpSession session) {

		User user = (User) session.getAttribute("user");
		Team specificTeam = teamDao.getTeam(user);
		Player player = new Player();
		player.setTeamId(specificTeam.getTeamId());
		model.put("player", player);
		return "playerForm";
	}

	@RequestMapping(value = "/createPlayer.htm")
	public String createplayer(@RequestParam("file") MultipartFile file ,Player player, HttpSession session, ModelMap model, HttpServletResponse response) {
		player.setPlayerImage(file.getOriginalFilename());
		User user = (User) session.getAttribute("user");
		Team specificTeam = teamDao.getTeam(user);
		session.setAttribute("playerList", playerDao.selectPlayerWithTeamId(specificTeam));
		model.put("team", specificTeam);
		playerDao.createPlayer(player);
		
		 if (!file.isEmpty()) {
				try {
					byte[] bytes = file.getBytes();

					// Creating the directory to store file
					String serverFileLocation = "C:\\Users\\Mayuresh\\Desktop\\images\\";					
					System.out.println(file.getOriginalFilename());
					
					// Create the file on server
					File serverFile = new File(serverFileLocation+""+file.getOriginalFilename());
					BufferedOutputStream stream = new BufferedOutputStream(
							new FileOutputStream(serverFile));
					stream.write(bytes);
					stream.close();

				} catch (Exception e)
				{
					e.printStackTrace();
				}
			} 
		 
		 
		 
		try {
			response.sendRedirect("teamProfile.htm");
		} catch (IOException e) {

			e.printStackTrace();
		}
		return "teamProfile";
	}

	@RequestMapping(value="/delete_player.htm")
	public String deletePlayer(HttpServletRequest request,ModelMap model,HttpSession session) {
		String pid = request.getParameter("playerId");
		int playerId = Integer.parseInt(pid);
		Player l = playerDao.selectOnePlayer(playerId);
		
		playerDao.deletePlayer(l);
		
		User user = (User)session.getAttribute("user");	
	
		Team specificTeam = teamDao.getTeam(user);
		session.setAttribute("playerList", playerDao.selectPlayerWithTeamId(specificTeam));
		model.put("team", specificTeam);
		return "teamProfile";
		
	}
	
	
	@RequestMapping(value="/update_player.htm")
	public String updatePlayer(Player player,ModelMap model,HttpSession session) {
		
		playerDao.updatePlayer(player);
		List<Player> l = playerDao.selectAllPlayer();
		model.put("plist", l);
		
		  User user = (User)session.getAttribute("user");
		 
		 Team specificTeam = teamDao.getTeam(user); session.setAttribute("playerList",
		 playerDao.selectPlayerWithTeamId(specificTeam));
		 model.put("team", specificTeam);
		 
		return "teamProfile";		
		
		
		/*
		 * List<Player> l = playerDao.selectAllPlayer(); model.put("plist", l); return
		 * "teamProfile";
		 */
	}
	
	@RequestMapping(value="/select_player.htm")
	public String updatePlayer(HttpServletRequest request,ModelMap model,Player player,HttpSession session) {
		String pid = request.getParameter("playerId");
		int playerId = Integer.parseInt(pid);
		Player p = playerDao.selectOnePlayer(playerId);
		model.put("player", p);
		return "update_player_form";
	}

	@RequestMapping(value = "/preTeamForm.htm")
	public String showTeamForm(ModelMap model) {
		model.put("team", new Team());
		return "teamForm";
	}

	@RequestMapping(value = "/postTeamForm.htm")
	public String TeamFormSuccess(Team team, ModelMap model, HttpSession session, HttpServletResponse response) {
		teamDao.createTeam(team);

		User user = (User) session.getAttribute("user");
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

	@RequestMapping(value = "/teamList.htm")
	public String showteamList(ModelMap model) {
		List<Team> teamList = teamDao.selectTeam();
		model.put("teamList", teamList);
		return "teamList";
	}

	@RequestMapping(value = "/teamRegistration.htm")
	public String teamRegistration(Tournament tournament, HttpServletResponse response, HttpSession session,
			HttpServletRequest request) {

		try {

			
			User user = (User) session.getAttribute("user");
			Team currentTeam = teamDao.getTeam(user);
			currentTeam.setTournamentId(tournament.getTournamentId());
			teamDao.updateTeam(currentTeam);

			response.sendRedirect("tournaments.htm");
		} catch (Exception e) {

			e.printStackTrace();
		}
		return "tournaments";
	}

	@RequestMapping(value = "/viewScoreCard.htm")
	public String showScoreCard() {

		return "scoreCard";
	}

	@RequestMapping(value = "/about.htm")
	public String showabout() {

		return "about";
	}

	@RequestMapping(value = "/addOne.htm", method = RequestMethod.GET)
	public void addOne(HttpServletRequest request, HttpServletResponse response, @RequestParam("score") String score, @RequestParam("teamId") String teamId , @RequestParam("playerId") String playerId, @RequestParam("playerBId") String playerBId) {
		
		
		Team team = teamDao.selectTeam(Long.parseLong(teamId));
		team.getTeamScore();
		team.setTeamScore(team.getTeamScore()+Long.parseLong(score));
		team.setTotalBalls(team.getTotalBalls() + 1 );
	    
		Player player = playerDao.selectPlayerWithPlayerId(Long.parseLong(playerId));
	    player.setPlayerCurrentScore(player.getPlayerCurrentScore() + Integer.parseInt(score) );
	    player.setPlayerTotalRuns(player.getPlayerTotalRuns() + Integer.parseInt(score));
		player.setBatsmanCurrentBalls(player.getBatsmanCurrentBalls() + 1);
		
		Player playerB = playerDao.selectPlayerWithPlayerId(Long.parseLong(playerBId));
		playerB.setCurrentBallsByBowler(playerB.getCurrentBallsByBowler() + 1);
		playerB.setBowlerCurrentRuns(playerB.getBowlerCurrentRuns() + 1);
		playerB.setBowlerTotalRuns(playerB.getBowlerTotalRuns() + 1);
		
	    System.out.println(team+"--------------------------");
	    
		teamDao.updateTeam(team);			
		
		playerDao.updatePlayer(player);
		playerDao.updatePlayer(playerB);
				
	}
	
	@RequestMapping(value = "/addTwo.htm", method = RequestMethod.GET)
	public void addTwo(HttpServletRequest request, HttpServletResponse response, @RequestParam("score") String score, @RequestParam("teamId") String teamId , @RequestParam("playerId") String playerId, @RequestParam("playerBId") String playerBId) {
		
		
		Team team = teamDao.selectTeam(Long.parseLong(teamId));
		team.getTeamScore();
		team.setTeamScore(team.getTeamScore()+Long.parseLong(score));
		team.setTotalBalls(team.getTotalBalls() + 1 );
	    
		Player player = playerDao.selectPlayerWithPlayerId(Long.parseLong(playerId));
	    player.setPlayerCurrentScore(player.getPlayerCurrentScore() + Integer.parseInt(score) );
	    player.setPlayerTotalRuns(player.getPlayerTotalRuns() + Integer.parseInt(score));
		player.setBatsmanCurrentBalls(player.getBatsmanCurrentBalls() + 1);
	    
		Player playerB = playerDao.selectPlayerWithPlayerId(Long.parseLong(playerBId));
		playerB.setCurrentBallsByBowler(playerB.getCurrentBallsByBowler() + 1);
		playerB.setBowlerCurrentRuns(playerB.getBowlerCurrentRuns() + 1);
		playerB.setBowlerTotalRuns(playerB.getBowlerTotalRuns() + 1);
		
	    
		System.out.println(team+"--------------------------");
	    
		teamDao.updateTeam(team);
	
		playerDao.updatePlayer(player);
		playerDao.updatePlayer(playerB);		
	}
	  
	@RequestMapping(value = "/addThree.htm", method = RequestMethod.GET)
	public void addThree(HttpServletRequest request, HttpServletResponse response, @RequestParam("score") String score, @RequestParam("teamId") String teamId , @RequestParam("playerId") String playerId, @RequestParam("playerBId") String playerBId) {
		
		
		Team team = teamDao.selectTeam(Long.parseLong(teamId));
		team.getTeamScore();
		team.setTeamScore(team.getTeamScore()+Long.parseLong(score));
		team.setTotalBalls(team.getTotalBalls() + 1 );
	   
		Player player = playerDao.selectPlayerWithPlayerId(Long.parseLong(playerId));
	    player.setPlayerCurrentScore(player.getPlayerCurrentScore() + Integer.parseInt(score) );
	    player.setPlayerTotalRuns(player.getPlayerTotalRuns() + Integer.parseInt(score));
		player.setBatsmanCurrentBalls(player.getBatsmanCurrentBalls() + 1);
	    
		Player playerB = playerDao.selectPlayerWithPlayerId(Long.parseLong(playerBId));
		playerB.setCurrentBallsByBowler(playerB.getCurrentBallsByBowler() + 1);
		playerB.setBowlerCurrentRuns(playerB.getBowlerCurrentRuns() + 1);
		playerB.setBowlerTotalRuns(playerB.getBowlerTotalRuns() + 1);
		
		
	    System.out.println(team+"--------------------------");
	    
		teamDao.updateTeam(team);
	
		playerDao.updatePlayer(player);
		playerDao.updatePlayer(playerB);			
	}
	@RequestMapping(value = "/addFour.htm", method = RequestMethod.GET)
	public void addFour(HttpServletRequest request, HttpServletResponse response, @RequestParam("score") String score, @RequestParam("teamId") String teamId , @RequestParam("playerId") String playerId, @RequestParam("playerBId") String playerBId) {
		
		
		Team team = teamDao.selectTeam(Long.parseLong(teamId));
		team.getTeamScore();
		team.setTeamScore(team.getTeamScore()+Long.parseLong(score));
		team.setTotalBalls(team.getTotalBalls() + 1 );
	    
		Player player = playerDao.selectPlayerWithPlayerId(Long.parseLong(playerId));
	    player.setPlayerCurrentScore(player.getPlayerCurrentScore() + Integer.parseInt(score) );
	    player.setPlayerTotalRuns(player.getPlayerTotalRuns() + Integer.parseInt(score));
		player.setBatsmanCurrentBalls(player.getBatsmanCurrentBalls() + 1);
		player.setCurrentMatch_4s(player.getCurrentMatch_4s() + 1);
		player.setTotal_4s(player.getTotal_4s() +1);
	    
		Player playerB = playerDao.selectPlayerWithPlayerId(Long.parseLong(playerBId));
		playerB.setCurrentBallsByBowler(playerB.getCurrentBallsByBowler() + 1);
		playerB.setBowlerCurrentRuns(playerB.getBowlerCurrentRuns() + 1);
		playerB.setBowlerTotalRuns(playerB.getBowlerTotalRuns() + 1);
		
		
	    System.out.println(team+"--------------------------");
	    
		teamDao.updateTeam(team);
	
		playerDao.updatePlayer(player);
		playerDao.updatePlayer(playerB);		
	}
	
	@RequestMapping(value = "/addFive.htm", method = RequestMethod.GET)
	public void addFive(HttpServletRequest request, HttpServletResponse response, @RequestParam("score") String score, @RequestParam("teamId") String teamId , @RequestParam("playerId") String playerId, @RequestParam("playerBId") String playerBId) {
		
		
		Team team = teamDao.selectTeam(Long.parseLong(teamId));
		team.getTeamScore();
		team.setTeamScore(team.getTeamScore()+Long.parseLong(score));
		team.setTotalBalls(team.getTotalBalls() + 1 );
	   
		Player player = playerDao.selectPlayerWithPlayerId(Long.parseLong(playerId));
	    player.setPlayerCurrentScore(player.getPlayerCurrentScore() + Integer.parseInt(score) );
	    player.setPlayerTotalRuns(player.getPlayerTotalRuns() + Integer.parseInt(score));
		player.setBatsmanCurrentBalls(player.getBatsmanCurrentBalls() + 1);
	    
		Player playerB = playerDao.selectPlayerWithPlayerId(Long.parseLong(playerBId));
		playerB.setCurrentBallsByBowler(playerB.getCurrentBallsByBowler() + 1);
		playerB.setBowlerCurrentRuns(playerB.getBowlerCurrentRuns() + 1);
		playerB.setBowlerTotalRuns(playerB.getBowlerTotalRuns() + 1);
		
		
	    System.out.println(team+"--------------------------");
	    
		teamDao.updateTeam(team);
	
		playerDao.updatePlayer(player);
		playerDao.updatePlayer(playerB);			
	}
	
	@RequestMapping(value = "/addSix.htm", method = RequestMethod.GET)
	public void addSix(HttpServletRequest request, HttpServletResponse response, @RequestParam("score") String score, @RequestParam("teamId") String teamId , @RequestParam("playerId") String playerId, @RequestParam("playerBId") String playerBId) {
		
		
		Team team = teamDao.selectTeam(Long.parseLong(teamId));
		team.getTeamScore();
		team.setTeamScore(team.getTeamScore()+Long.parseLong(score));
		team.setTotalBalls(team.getTotalBalls() + 1 );
	   
		Player player = playerDao.selectPlayerWithPlayerId(Long.parseLong(playerId));
	    player.setPlayerCurrentScore(player.getPlayerCurrentScore() + Integer.parseInt(score) );
	    player.setPlayerTotalRuns(player.getPlayerTotalRuns() + Integer.parseInt(score));
		player.setBatsmanCurrentBalls(player.getBatsmanCurrentBalls() + 1);
		player.setCurrentMatch_6s(player.getCurrentMatch_6s() + 1);
		player.setTotal_6s(player.getTotal_6s() +1);
	    
		Player playerB = playerDao.selectPlayerWithPlayerId(Long.parseLong(playerBId));
		playerB.setCurrentBallsByBowler(playerB.getCurrentBallsByBowler() + 1);
		playerB.setBowlerCurrentRuns(playerB.getBowlerCurrentRuns() + 1);
		playerB.setBowlerTotalRuns(playerB.getBowlerTotalRuns() + 1);
		
		
	    System.out.println(team+"--------------------------");
	    
		teamDao.updateTeam(team);
	
		playerDao.updatePlayer(player);
		playerDao.updatePlayer(playerB);	
	}
	
	@RequestMapping(value = "/addZero.htm", method = RequestMethod.GET)
	public void addZero(HttpServletRequest request, HttpServletResponse response, @RequestParam("score") String score, @RequestParam("teamId") String teamId , @RequestParam("playerId") String playerId, @RequestParam("playerBId") String playerBId) {
		
		
		Team team = teamDao.selectTeam(Long.parseLong(teamId));
		team.getTeamScore();
		team.setTeamScore(team.getTeamScore()+Long.parseLong(score));
		team.setTotalBalls(team.getTotalBalls() + 1 );
	    
		Player player = playerDao.selectPlayerWithPlayerId(Long.parseLong(playerId));
	    player.setPlayerCurrentScore(player.getPlayerCurrentScore() + Integer.parseInt(score) );
	    player.setPlayerTotalRuns(player.getPlayerTotalRuns() + Integer.parseInt(score));
		player.setBatsmanCurrentBalls(player.getBatsmanCurrentBalls() + 1);
	    
		Player playerB = playerDao.selectPlayerWithPlayerId(Long.parseLong(playerBId));
		playerB.setCurrentBallsByBowler(playerB.getCurrentBallsByBowler() + 1);
		playerB.setBowlerCurrentRuns(playerB.getBowlerCurrentRuns() + 1);
		playerB.setBowlerTotalRuns(playerB.getBowlerTotalRuns() + 1);
		
		
	    System.out.println(team+"--------------------------");
	    
		teamDao.updateTeam(team);
	
		playerDao.updatePlayer(player);
		playerDao.updatePlayer(playerB);		
	}
	
	@RequestMapping(value = "/Wide.htm", method = RequestMethod.GET)
	public void Wide(HttpServletRequest request, HttpServletResponse response, @RequestParam("score") String score, @RequestParam("teamId") String teamId , @RequestParam("playerId") String playerId, @RequestParam("playerBId") String playerBId) {
		
		
		Team team = teamDao.selectTeam(Long.parseLong(teamId));
		team.getTeamScore();
		team.setTeamScore(team.getTeamScore()+Long.parseLong(score));
	    
		Player playerB = playerDao.selectPlayerWithPlayerId(Long.parseLong(playerBId));
		playerB.setBowlerCurrentRuns(playerB.getBowlerCurrentRuns() + 1);
		playerB.setBowlerTotalRuns(playerB.getBowlerTotalRuns() + 1);
		
	    	    
	    System.out.println(team+"--------------------------");
	    
		teamDao.updateTeam(team);
		playerDao.updatePlayer(playerB);			
	}
	
	@RequestMapping(value = "/NoBall.htm", method = RequestMethod.GET)
	public void NoBall(HttpServletRequest request, HttpServletResponse response, @RequestParam("score") String score, @RequestParam("teamId") String teamId , @RequestParam("playerId") String playerId, @RequestParam("playerBId") String playerBId) {
		
		
		Team team = teamDao.selectTeam(Long.parseLong(teamId));
		team.getTeamScore();
		team.setTeamScore(team.getTeamScore()+Long.parseLong(score));
	    
		Player playerB = playerDao.selectPlayerWithPlayerId(Long.parseLong(playerBId));
		playerB.setBowlerCurrentRuns(playerB.getBowlerCurrentRuns() + 1);
		playerB.setBowlerTotalRuns(playerB.getBowlerTotalRuns() + 1);
		
	    System.out.println(team+"--------------------------");
	    
		teamDao.updateTeam(team);
		playerDao.updatePlayer(playerB);			
	}
	
	@RequestMapping(value = "/teamChange.htm", method = RequestMethod.GET)
	public void status(HttpServletRequest request, HttpServletResponse response, @RequestParam("status") String status, @RequestParam("teamId") String teamId) {
		
		
		Team team = teamDao.selectTeam(Long.parseLong(teamId));
		team.setTeamStatus(status);    
	    	    
	    System.out.println(team+"--------------------------");
	    
		teamDao.updateTeam(team);
					
	}
	
	
	@RequestMapping(value = "/wicket.htm", method = RequestMethod.GET)
	public void wicket(HttpServletRequest request, HttpServletResponse response, @RequestParam("score") String score, @RequestParam("teamId") String teamId , @RequestParam("playerId") String playerId, @RequestParam("playerBId") String playerBId) {
		
		
		Team team = teamDao.selectTeam(Long.parseLong(teamId));
		
		team.setTotalWickets((team.getTotalWickets()) + Integer.parseInt(score));
		team.setTotalBalls(team.getTotalBalls() + 1 );
		
	    Player player = playerDao.selectPlayerWithPlayerId(Long.parseLong(playerId));
	    player.setBatsmanCurrentBalls(player.getBatsmanCurrentBalls() + 1);
	    player.setPlayerStatus("out");
	    
	    
	    Player playerB = playerDao.selectPlayerWithPlayerId(Long.parseLong(playerBId));
		
		playerB.setCurrentMatchWickets(playerB.getCurrentMatchWickets() + 1);
		playerB.setTotalWickets(playerB.getTotalWickets() + 1);
		
		
		
		
	    System.out.println(team+"--------------------------");
	    
		teamDao.updateTeam(team);
	
		playerDao.updatePlayer(player);
		playerDao.updatePlayer(playerB);			
	}

}