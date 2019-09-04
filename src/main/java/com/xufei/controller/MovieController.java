package com.xufei.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xufei.entity.Clazz;
import com.xufei.entity.Movie;
import com.xufei.service.MovieService;

@Controller
public class MovieController {
	
	@Resource
	private MovieService movieService;
	
	@RequestMapping("list.do")
	public String list(Model model,
			@RequestParam(defaultValue="")String mname,
			@RequestParam(defaultValue="1")int pageNum,
			@RequestParam(defaultValue="3")int pageSize
			) {
		Map<String,Object> map = new HashMap<>();
		map.put("mname", mname);
		PageHelper.startPage(pageNum, pageSize);
		List<Map<String,Object>> movieList=movieService.findMovieList(map);
		PageInfo<Map<String,Object>> pageInfo = new PageInfo<>(movieList);
		model.addAttribute("movieList", movieList);
		model.addAttribute("page", pageInfo);
		model.addAttribute("map", map);
		return "list";
	}
	
	@RequestMapping("toAdd.do")
	public String toAdd(Model model) {
		List<Clazz> clazzList=movieService.findClazzList();
		model.addAttribute("clazzList", clazzList);
		return "add";
	}
	
	@RequestMapping("toUpdate.do")
	public String toUpdate(Model model,Movie movie) {
		movie=movieService.getMovieById(movie);
		List<Clazz> clazzList=movieService.findClazzList();
		model.addAttribute("clazzList", clazzList);
		model.addAttribute("movie", movie);
		return "update";
	}

	@RequestMapping("add.do")
	public String addMovie(Movie movie) {
		int i = movieService.addMovie(movie);
		return "redirect:list.do";
	}
	
	@RequestMapping("updateMovie.do")
	public String updateMovie(Movie movie) {
		int i = movieService.updateMovie(movie);
		return "redirect:list.do";
	}
	
	@RequestMapping("deleteMovie.do")
	@ResponseBody
	public int deleteMovie(Movie movie) {
		int deleteMovie = movieService.deleteMovie(movie);
		return deleteMovie;
	}
	
	@RequestMapping("deleteAllMovie.do")
	@ResponseBody
	public Object deleteAllMovie(String[] mids) {
		int deleteAllMovie = movieService.deleteAllMovie(mids);
		return deleteAllMovie;
	}
}
