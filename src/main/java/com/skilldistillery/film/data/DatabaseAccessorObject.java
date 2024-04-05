package com.skilldistillery.film.data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import org.springframework.stereotype.Component;

import com.skilldistillery.film.entities.Actor;
import com.skilldistillery.film.entities.Film;

@Component
public class DatabaseAccessorObject implements DatabaseAccessor {
	Scanner kb = new Scanner(System.in);
	private static final String URL = "jdbc:mysql://localhost:3306/sdvid";

	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public Film findFilmById(int filmId) {
		Film film = null;

		String user = "student";
		String pass = "student";
		try {
			Connection conn = DriverManager.getConnection(URL, user, pass);

			String sql = "SELECT film.*,language.*"
					+ " FROM film JOIN language ON film.language_id = language.id WHERE film.id=?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, filmId);
			// System.out.println(stmt);

//SELECT category.*, film.*,language.* 
//FROM category 
//OIN film_category ON category.id = film_category.film_id 
//JOIN film ON film.id = film_category.film_id 
//JOIN language ON language.id = film.id
//WHERE film.id = ?;

//			title, year, rating, description, language, list of actors

//			|---------------------|
//			| 1 View full details |
//			| 2 return to menu    |
//          |---------------------|

			ResultSet idResult = stmt.executeQuery();
			// System.out.println(idResult);
			if (idResult.next()) {

				String title = idResult.getString("title");
				String description = idResult.getString("description");
				short releaseYear = idResult.getShort("release_year");
				int languageId = idResult.getInt("language_id");
				int rentalDuration = idResult.getInt("rental_duration");
				double rentalRate = idResult.getInt("rental_rate");
				double lengthOfFilm = idResult.getInt("length");
				double replacementCost = idResult.getInt("replacement_cost");
				String rating = idResult.getString("rating");
				String specialFeatures = idResult.getString("special_features");
				String filmLanguage = idResult.getString("name");

				// int filmId, String title, String description, int releaseYear,
				// int languageId, int rentalDuration,
				// double rentalRate, double lengthOfFilm, double replacementCost, String
				// rating, String specialFeatures,
				// String filmLanguage

				film = new Film(filmId, title, description, releaseYear, languageId, rentalDuration, rentalRate,
						lengthOfFilm, replacementCost, rating, specialFeatures, filmLanguage);
				// System.out.println("**************************************************************"
				// + film);

				idResult.close();
				stmt.close();
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return film;

	}

	@Override
	public List<Actor> findActorsByFilmId(int filmId) {

		List<Actor> actors = new ArrayList<>();

		// Actor actor = null;
		String user = "student";
		String pass = "student";
		// Connect to DBMS
		try {
			Connection conn = DriverManager.getConnection(URL, user, pass);
			// Title, year, rating, description, actors
			String sql = "SELECT actor.*"
					+ " FROM actor JOIN film_actor ON actor.id = film_actor.actor_id WHERE film_actor.film_id = ?";

			PreparedStatement stmt = conn.prepareStatement(sql);

			stmt.setInt(1, filmId);
			// System.out.println(stmt);

			ResultSet filmIdResult = stmt.executeQuery();
			while (filmIdResult.next()) {
				int actorId = filmIdResult.getInt("id");
				String firstName = filmIdResult.getString("first_name");
				String lastName = filmIdResult.getString("last_name");
				Actor actor = new Actor(actorId, firstName, lastName);

				actors.add(actor);

			}
			filmIdResult.close();
			stmt.close();
			conn.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return actors;

	}

	public List<Film> findFilmsByKeyword(String keyword) {

		List<Film> films = new ArrayList<>();
		String user = "student";
		String pass = "student";

		try {
			Connection conn = DriverManager.getConnection(URL, user, pass);
			// actor.* FROM
			String sql = "SELECT film.*, language.*" + " FROM film" + " JOIN language ON film.language_id = language.id"
					+ " WHERE film.title LIKE ? OR film.description LIKE ?";

			// System.out.println(sql);
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, "%" + keyword + "%");
			stmt.setString(2, "%" + keyword + "%");
			// System.out.println(stmt);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				// title, year, rating, description, and language
				int filmId = rs.getInt("id");
				String title = rs.getString("title");
				String description = rs.getString("description");
				short releaseYear = rs.getShort("release_year");
				int languageId = rs.getInt("language_id");
				int rentalDuration = rs.getInt("rental_duration");
				double rentalRate = rs.getInt("rental_rate");
				double lengthOfFilm = rs.getInt("length");
				double replacementCost = rs.getInt("replacement_cost");
				String rating = rs.getString("rating");
				String specialFeatures = rs.getString("special_features");
				String filmLanguage = rs.getString("name");

				Film film = new Film(filmId, title, description, releaseYear, languageId, rentalDuration, rentalRate,
						lengthOfFilm, replacementCost, rating, specialFeatures, filmLanguage);

				films.add(film);
				// System.out.println(film);
			}

			rs.close();
			stmt.close();
			conn.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return films;
	}

	@Override
	public Actor findActorById(int actorId) {
//		public Actor(int id, String firstName, String lastName)
		Actor actor = null;

		String user = "student";
		String pass = "student";
		try {
			Connection conn = DriverManager.getConnection(URL, user, pass);
			// Title, year, rating and description
//			SELECT film.id, film.title, film.release_year, film.rating, film.description, language.name 
//			FROM film 
//			JOIN language 
//			ON film.language_id = language.id  
//			WHERE film.id = 1;

			String sql = "SELECT actor.*" + " FROM actor WHERE actor.id=?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, actorId);
			// System.out.println(stmt);

			ResultSet actorResult = stmt.executeQuery();
			if (actorResult.next()) {
				actor = new Actor();
				actor.setId(actorResult.getInt("actor_id"));
				actor.setFirstName(actorResult.getString("first_name"));
				actor.setLastName(actorResult.getString("last_name"));

//				set actor first and last name 

				actorResult.close();
				stmt.close();
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return actor;

	}

	public Film createFilm(Film film) {
		//Film newFilm = null;
		String url = "jdbc:mysql://localhost:3306/sdvid?useSSL=false&useLegacyDatetimeCode=false&serverTimezone=US/Mountain";
		String user = "student";
		String pword = "student";

//	    int id, String title, String description, int releaseYear, int languageId, int rentalDuration,
//		double rentalRate, double lengthOfFilm, double replacementCost, String rating, String specialFeatures,
//		String filmLanguage

		String sql = "INSERT INTO film (film_title, film_description) VALUES (?, ?)";
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, user, pword);
			conn.setAutoCommit(false); // Start transaction
			PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			stmt.setString(1, film.getTitle());
			stmt.setString(2, film.getDescription());

			int uc = stmt.executeUpdate();
			System.out.println(uc + " film record created.");
			if(uc == 1) {
			ResultSet keys = stmt.getGeneratedKeys();
			if (keys.next()) {
				  int newFilmId = keys.getInt(1);
			        film.setId(newFilmId);
			        if (film.getActors() != null && film.getActors().size() > 0) {
			          sql = "INSERT INTO film_actor (film_id, actor_id) VALUES (?,?)";
			          stmt = conn.prepareStatement(sql);
			          for (Actor actor : film.getActors()) {
			            stmt.setString(1, film.getTitle());
			            stmt.setString(2, film.getDescription());
			            uc = stmt.executeUpdate();
			          }
			        }
			      }
			    } else {
			      film = null;
			    }
		    conn.commit(); // COMMIT TRANSACTION
		  } catch (SQLException sqle) {
		    sqle.printStackTrace();
		    if (conn != null) {
		      try { conn.rollback(); }
		      catch (SQLException sqle2) {
		        System.err.println("Error trying to rollback");
		      }
		    }
		    throw new RuntimeException("Error inserting film " + film);
		  }
		  return film;
		}

	
}