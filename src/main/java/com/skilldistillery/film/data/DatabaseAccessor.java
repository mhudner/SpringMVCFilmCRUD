package com.skilldistillery.film.data;

import java.util.List;

import com.skilldistillery.filmquery.entities.Actor;
import com.skilldistillery.filmquery.entities.Film;

public interface DatabaseAccessor {
	public Film findFilmById(int filmId);

	public Actor findActorById(int actorId);

	public List<Film> findFilmsByKeyword(String keyword);

	public List<Actor> findActorsByFilmId(int FilmId);

	public Film createFilm(Film film);

	// public List<Actor> findFilmByActorId(int filmId);
}
