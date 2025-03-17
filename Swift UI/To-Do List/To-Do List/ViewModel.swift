//
//  ViewModel.swift
//  To-Do List
//
//  Created by Shaik Areef on 11/03/25.
//

import Foundation

@Observable class ViewModel {
    
    var tasks: [ToDo] = [] {
        didSet {
            saveTasks()
        }
    }
    
    init() {
        loadTasks()
    }
    
    private let tasksKey = "saved_tasks"
    
    func addTask(task: ToDo) {
        tasks.append(task)
    }
    
    func deleteTask(at index: IndexSet) {
        tasks.remove(atOffsets: index)
    }
    
    func toggleCompletion(for task: ToDo) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
            print(task.isCompleted)
        }
    }
    
    private func saveTasks() {
        if let encoded = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encoded, forKey: tasksKey)
        }
    }
    
    private func loadTasks() {
        if let savedData = UserDefaults.standard.data(forKey: tasksKey),
           let decodedTasks = try? JSONDecoder().decode([ToDo].self, from: savedData) {
            tasks = decodedTasks
        }
    }
}
