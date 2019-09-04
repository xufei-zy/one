package com.xufei.service;

import java.util.List;
import java.util.Map;

import com.xufei.entity.Clazz;
import com.xufei.entity.Movie;

public interface MovieService {

	List<Map<String, Object>> findMovieList(Map<String, Object> map);
	
	List<Clazz> findClazzList();
	
	Movie getMovieById(Movie movie);
	
	int addMovie(Movie movie);

	int deleteMovie(Movie movie);
	
	int deleteAllMovie(String[] mids);
	
	int updateMovie(Movie movie);
}
