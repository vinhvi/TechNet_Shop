package com.web.techNet.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.web.techNet.repository.StatiticRepo;
import com.web.techNet.entity.Statitics;
import com.web.techNet.model.StatisticalForMonthProjections;
import com.web.techNet.model.StatisticalForProductProjections;
import com.web.techNet.model.StatisticalForYearProjections;
import com.web.techNet.service.StatisticalService;

@Service
public class StatisticalServiceImpl implements StatisticalService {

	@Autowired
	StatiticRepo sdao;

	@Override
	public Statitics SLOrder() {
		return sdao.SLOrder();
	}

	@Override
	public List<StatisticalForMonthProjections> statisticalForMonth() {
		return sdao.statisticalForMonth();
	}

	@Override
	public List<StatisticalForYearProjections> statisticalForYear() {
		return sdao.statisticalForYear();
	}

	@Override
	public List<StatisticalForProductProjections> statisticalForProduct() {
		return sdao.statisticalForProduct();
	}	
}
