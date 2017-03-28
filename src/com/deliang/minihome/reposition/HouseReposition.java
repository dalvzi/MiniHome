package com.deliang.minihome.reposition;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.deliang.minihome.entities.House;
import com.deliang.minihome.entities.User;

public interface HouseReposition extends JpaRepository<House, Integer>{

	House getById(Integer id);
	
	List<House> getByUser(User user);
}
