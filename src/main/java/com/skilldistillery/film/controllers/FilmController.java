package com.skilldistillery.film.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.film.data.DatabaseAccessor;
import com.skilldistillery.film.entities.Film;

@Controller
public class FilmController {

	@Autowired
	private DatabaseAccessor dao;

	@RequestMapping(path = { "", "/", "index", "index.do" })
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;

	}

	@RequestMapping(path = { "find.do" }, method = RequestMethod.GET)
	public String findFilmById(@RequestParam("id") int id, Model model) {
		Film film = dao.findFilmById(id);
		model.addAttribute("film", film);
		return "film";

	}

	@RequestMapping(path = { "addFilm.do" }, method = RequestMethod.POST)
	public ModelAndView addFilm(Film film) {
		ModelAndView mv = new ModelAndView();
		System.out.println("*****************************" + film);
		dao.createFilm(film);
		System.out.println("*****************************" + film);
		mv.setViewName("film");
		mv.addObject("film", film);

		return mv;
	}

	@RequestMapping(path = { "delete" }, method = RequestMethod.POST)
	public ModelAndView deleteFilm(@RequestParam("id") int id) {

		ModelAndView mv = new ModelAndView();
		Film film = dao.findFilmById(id);
		System.out.println("*****************************" + film);

		boolean deleted = dao.deleteFilm(film);

		mv.setViewName("delete");
		mv.addObject("delete", deleted);

		return mv;
	}

	@RequestMapping(path = { "updateFilm.do" }, method = RequestMethod.POST)
	public ModelAndView editFilm(Film film) {

		ModelAndView mv = new ModelAndView();
//		System.out.println("*****************************" + film + "ln 71");
		dao.updateFilm(film);
		System.out.println("*****************************" + film + "ln 73");
		mv.setViewName("film");
		mv.addObject("film", film);

		return mv;
	}

	@RequestMapping(path = { "editFilm" }, method = RequestMethod.POST)
	public String updateFilm(@RequestParam("id") int id, Model mv) {

		mv.addAttribute("film", dao.findFilmById(id));

		return "UpdateFilm";
	}
}
