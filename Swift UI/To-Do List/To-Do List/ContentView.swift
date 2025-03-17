//
//  ContentView.swift
//  To-Do List
//
//  Created by Shaik Areef on 11/03/25.
//

import SwiftUI

struct ContentView: View {
    var viewModel: ViewModel
    @State private var showAddTask = false

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.tasks.sorted { $0.endDate < $1.endDate }) { task in
                    NavigationLink(destination: TaskDetailView(task: task)) {
                        TaskRowView(task: task)
                    }
                    .swipeActions(edge: .leading) {
                        Button(action: {
                            viewModel.toggleCompletion(for: task)
                        }) {
                            Label(task.isCompleted ? "Complete" : "Incomplete", systemImage: task.isCompleted ? "checkmark.circle" : "multiply.circle.fill")
                        }
                        .tint(.green)
                    }
                }
                .onDelete(perform: viewModel.deleteTask)
            }
            .navigationTitle("To-Do List")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: { showAddTask = true }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                    }
                }
            }
            .sheet(isPresented: $showAddTask) {
                AddTaskView(viewModel: viewModel)
            }
        }
    }
}

struct TaskRowView: View {
    var task: ToDo

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(task.title)
                    .font(.headline)
                    .strikethrough(task.isCompleted, color: .gray)
                
                HStack {
                    Text(task.endDate, style: .date)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text(task.endTime, style: .time)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            Spacer()
        }
        .padding(.vertical, 5)
    }
}

struct AddTaskView: View {
    var viewModel: ViewModel
    @Environment(\.dismiss) var dismiss

    @State private var taskTitle: String = ""
    @State private var endDate: Date = Date()
    @State private var endTime: Date = Date()
    @State private var description: String = ""

    var body: some View {
        NavigationView {
            Form {
                TextField("Task", text: $taskTitle)
                DatePicker("End Date", selection: $endDate, displayedComponents: .date)
                DatePicker("End Time", selection: $endTime, displayedComponents: .hourAndMinute)
                TextField("Description", text: $description)
            }
            .navigationTitle("New Task")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        let newTask = ToDo(title: taskTitle, endDate: endDate, endTime: endTime, description: description)
                        viewModel.addTask(task: newTask)
                        dismiss()
                    }
                    .disabled(taskTitle.isEmpty)
                }
            }
        }
    }
}

struct TaskDetailView: View {
    var task: ToDo

    var body: some View {
        VStack {
            Text(task.title)
                .font(.system(size: 40, weight: .bold))
            Text(task.endDate, style: .date)
                .font(.system(size: 30))
            Text(task.description)
                .font(.system(size: 20))
            Spacer()
        }
        .padding()
        .navigationTitle("Task Details")
    }
}


#Preview {
    ContentView(viewModel: ViewModel())
}
