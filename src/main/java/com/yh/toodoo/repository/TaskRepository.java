package com.yh.toodoo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.yh.toodoo.model.Task;

@Repository
public interface TaskRepository extends JpaRepository<Task, Long>{

}
