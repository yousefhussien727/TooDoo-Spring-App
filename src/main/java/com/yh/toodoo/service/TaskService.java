package com.yh.toodoo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.yh.toodoo.model.Task;
import com.yh.toodoo.repository.TaskRepository;

@Service
public class TaskService {

    private final TaskRepository taskRepository;

    public TaskService(TaskRepository taskRepository) {
        this.taskRepository = taskRepository;
    }

    public List<Task> getAllTasks() {
        return taskRepository.findAll();
    }

    public void addTask(Task newTask) {
        taskRepository.save(newTask);
    }

    public void deleteTask(Long id) {
        taskRepository.deleteById(id);
    }

    public void toggleTask(Long id) {
        Task task = taskRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("Task not exists!"));
        task.setCompleted(!task.isCompleted());
        taskRepository.save(task);
    }

    public void updateTask(Long id, String title) {
        Task task = taskRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("Task not exists!"));
        task.setTitle(title);
        taskRepository.save(task);
    }
    
}
