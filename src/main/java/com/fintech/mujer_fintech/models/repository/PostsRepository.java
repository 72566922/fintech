package com.fintech.mujer_fintech.models.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fintech.mujer_fintech.models.entity.Posts;

@Repository
public interface PostsRepository extends JpaRepository<Posts, Long> {
    
}