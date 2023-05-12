package com.web.techNet.service;

import java.util.List;
import org.springframework.stereotype.Service;
import com.web.techNet.entity.Statitics;
import com.web.techNet.model.StatisticalForMonthProjections;
import com.web.techNet.model.StatisticalForProductProjections;
import com.web.techNet.model.StatisticalForYearProjections;

@Service
public interface StatisticalService {

	Statitics SLOrder();

	List<StatisticalForProductProjections> statisticalForProduct();

	List<StatisticalForYearProjections> statisticalForYear();

	List<StatisticalForMonthProjections> statisticalForMonth();

}
