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

			ResultSet idResult = stmt.executeQuery();
			// System.out.println(idResult);
			if (idResult.next()) {

				String title = idResult.getString("title");
				String description = idResult.getString("description");
				Integer releaseYear = idResult.getInt("release_year");
				int languageId = idResult.getInt("language_id");
				int rentalDuration = idResult.getInt("rental_duration");
				double rentalRate = idResult.getDouble("rental_rate");
				int length = idResult.getInt("length");
				double replacementCost = idResult.getInt("replacement_cost");
				String rating = idResult.getString("rating");
				String specialFeatures = idResult.getString("special_features");
				String filmLanguage = idResult.getString("name");

				// int filmId, String title, String description, int releaseYear,
				// int languageId, int rentalDuration,
				// double rentalRate, double lengthOfFilm, double replacementCost, String
				// rating, String specialFeatures,
				// String filmLanguage

				film = new Film(filmId, title, description, releaseYear, languageId, rentalDuration, rentalRate, length,
						replacementCost, rating, specialFeatures, filmLanguage);
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

	@Override
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
				Integer releaseYear = rs.getInt("release_year");
				int languageId = rs.getInt("language_id");
				int rentalDuration = rs.getInt("rental_duration");
				double rentalRate = rs.getDouble("rental_rate");
				int length = rs.getInt("length");
				double replacementCost = rs.getDouble("replacement_cost");
				String rating = rs.getString("rating");
				String specialFeatures = rs.getString("special_features");
				String filmLanguage = rs.getString("name");

				Film film = new Film(filmId, title, description, releaseYear, languageId, rentalDuration, rentalRate,
						length, replacementCost, rating, specialFeatures, filmLanguage);

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

	@Override
	public Film createFilm(Film film) {
		// Film newFilm = null;
		String url = "jdbc:mysql://localhost:3306/sdvid";
		String user = "student";
		String pword = "student";

//	    int id, String title, String description, int releaseYear, int languageId, int rentalDuration,
//		double rentalRate, double lengthOfFilm, double replacementCost, String rating, String specialFeatures,
//		String filmLanguage

		String sql = "INSERT INTO film (title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating) VALUES (?, ?, ?, 1, ?, ?, ?, ?, ?)";
		Connection conn = null;
		System.out.println("***************************" + film);

		try {
			conn = DriverManager.getConnection(url, user, pword);
			conn.setAutoCommit(false); // Start transaction
			PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			stmt.setString(1, film.getTitle());
			stmt.setString(2, film.getDescription());
			stmt.setInt(3, film.getReleaseYear());
			stmt.setInt(4, film.getRentalDuration());
			stmt.setDouble(5, film.getRentalRate());
			stmt.setInt(6, film.getLength());
			stmt.setDouble(7, film.getReplacementCost());
			stmt.setString(8, film.getRating());

			System.out.println("*************************************************" + stmt);
			int uc = stmt.executeUpdate();
			System.out.println(uc + " film record created.");
			if (uc == 1) {
				ResultSet keys = stmt.getGeneratedKeys();
				if (keys.next()) {
					int newFilmId = keys.getInt(1);
					film.setId(newFilmId);
				}
				System.out.println(film);
			} else {
				film = null;
			}
			conn.commit(); // COMMIT TRANSACTION
		} catch (SQLException sqle) {
			sqle.printStackTrace();
			if (conn != null) {
				try {
					conn.rollback();
				} catch (SQLException sqle2) {
					System.err.println("Error trying to rollback");
				}
			}
			throw new RuntimeException("Error inserting film " + film);
		}
		return film;
	}

	@Override
	public boolean deleteFilm(Film film) {
		// Film newFilm = null;
		String url = "jdbc:mysql://localhost:3306/sdvid";
		String user = "student";
		String pword = "student";

//	    int id, String title, String description, int releaseYear, int languageId, int rentalDuration,
//		double rentalRate, double lengthOfFilm, double replacementCost, String rating, String specialFeatures,
//		String filmLanguage

		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, user, pword);
			conn.setAutoCommit(false); // Start transaction
			String sql = "DELETE FROM film WHERE film.id = ?";
			PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			stmt.setInt(1, film.getId());
			int uc = stmt.executeUpdate();
			conn.commit();

		} catch (SQLException sqle) {
			sqle.printStackTrace();
			if (conn != null) {
				try {
					conn.rollback();
				} catch (SQLException sqle2) {
					System.err.println("Error trying to rollback");
				}
			}
			System.out.println("************************************************" + false);
			return false;
		}
		System.out.println("************************************************" + true);
		return true;
	}

	@Override
	public boolean updateFilm(Film film) {

		String url = "jdbc:mysql://localhost:3306/sdvid";
		String user = "student";
		String pword = "student";

		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, user, pword);
			conn.setAutoCommit(false); // START TRANSACTION
			String sql = "UPDATE film SET title = ?, description = ?, release_year = ?, language_id = ?, rental_duration = ?, "
					+ "rental_rate = ?, length = ?, replacement_cost = ?, rating = ?" + " WHERE id=?";

//		    int id, String title, String description, int releaseYear, int languageId, int rentalDuration,
//			double rentalRate, double lengthOfFilm, double replacementCost, String rating, String specialFeatures,
//			String filmLanguage

			PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			stmt.setString(1, film.getTitle());
			stmt.setString(2, film.getDescription());
			stmt.setInt(3, film.getReleaseYear());
			stmt.setInt(4, 1);
			stmt.setInt(5, film.getRentalDuration());
			stmt.setDouble(6, film.getRentalRate());
			stmt.setInt(7, film.getLength());
			stmt.setDouble(8, film.getReplacementCost());
			stmt.setString(9, "G");
			stmt.setInt(10, film.getId());

//			
			System.out.println("***" + stmt);
			int updateCount = stmt.executeUpdate();

			System.out.println(updateCount);
//			if (updateCount == 1) {
			// Replace actor's film list
//		      sql = "DELETE FROM film WHERE film.id = ?";
//		      stmt = conn.prepareStatement(sql);
//		      stmt.setInt(1, film.getId());
//				updateCount = stmt.executeUpdate();
//		      sql = "INSERT INTO film(title, description, release_year, language_id, rental_duration, "
//		      		+ "rental_rate, length, replacement_cost, rating) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
//		      		 stmt = conn.prepareStatement(sql);
//		      for (Film film : film.getFilms()) {
//		        stmt.setInt(1, film.getId());
//		        stmt.setInt(2, film.getId());
//		        updateCount = stmt.executeUpdate();
//		      }

			System.out.println("Its about to commit");
			conn.commit(); // COMMIT TRANSACTION
//			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
			if (conn != null) {
				try {
					conn.rollback();
					System.err.println("Error trying to rollback");
				} // ROLLBACK TRANSACTION ON ERROR
				catch (SQLException sqle2) {

				}
			}
			return false;
		}
		return true;
	}

//					if (film.getActors() != null && film.getActors().size() > 0) {
//						sql = "INSERT INTO film_actor (film_id, actor_id) VALUES (?,?)";
//						stmt = conn.prepareStatement(sql);
//						for (Actor actor : film.getActors()) {
//							stmt.setString(1, film.getTitle());
//							stmt.setString(2, film.getDescription());
//							uc = stmt.executeUpdate();
//						}
//					}
}