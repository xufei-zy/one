package com.xufei.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xufei.entity.Clazz;
import com.xufei.entity.Movie;
import com.xufei.mapper.MovieMapperDao;

@Service
public class MovieServicelmpl implements MovieService{
	
	@Resource
	private MovieMapperDao movieMapperDao;

	@Override
	public List<Map<String, Object>> findMovieList(Map<String, Object> map) {
		return movieMapperDao.findMovieList(map);
	}

	@Override
	public List<Clazz> findClazzList() {
		return movieMapperDao.findClazzList();
	}

	@Override
	public Movie getMovieById(Movie movie) {
		return movieMapperDao.getMovieById(movie);
	}

	@Override
	public int addMovie(Movie movie) {
		return movieMapperDao.addMovie(movie);
	}

	@Override
	public int deleteMovie(Movie movie) {
		return movieMapperDao.deleteMovie(movie);
	}

	@Override
	public int deleteAllMovie(String[] mids) {
		return movieMapperDao.deleteAllMovie(mids);
	}

	@Override
	public int updateMovie(Movie movie) {
		return movieMapperDao.updateMovie(movie);
	}
}
