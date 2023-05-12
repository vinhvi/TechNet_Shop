package com.web.techNet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.web.techNet.entity.Favorite;

@Repository
public interface FavoriteRepo extends JpaRepository<Favorite, Long> {


}
