package com.deliang.minihome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.deliang.minihome.entities.House;
import com.deliang.minihome.entities.User;
import com.deliang.minihome.reposition.HouseReposition;

@Service
public class HouseService {

	@Autowired
	private HouseReposition houseReposition;
	
	
	
	public int houseUpOrDown(Integer id) {
		House house = get(id);
		if(1 == house.getOnSell()) {
			house.setOnSell((byte)0);
		}else if(0 == house.getOnSell()) {
			house.setOnSell((byte)1);
		}
		save(house);
		return house.getOnSell();
	}
	
	public House get(Integer id) {
		return houseReposition.getById(id);
	}
	
	public void delete(Integer id) {
		houseReposition.delete(id);
	}

	public List<House> getCriteriaHouse(String location, double minSize,
			double maxSize, double minPrice, double maxPrice) {
		
		List<House> criteriaHouses = houseReposition
				.getByLocationLikeOrSizeBetweenOrPriceBetween(location,
						minSize, maxSize, minPrice, maxPrice);

		return criteriaHouses;
	}

	@Transactional
	public void save(House house) {
		houseReposition.saveAndFlush(house);
	}

	public Page<House> getPage(int pageNo, int pageSize) {
		PageRequest pageable = new PageRequest(pageNo - 1, pageSize);
		return houseReposition.findAll(pageable);
	}

	public House getHouseById(Integer id) {
		return houseReposition.getById(id);
	}

	public List<House> getHousesByUserId(User user) {
		return houseReposition.getByUser(user);
	}

}
