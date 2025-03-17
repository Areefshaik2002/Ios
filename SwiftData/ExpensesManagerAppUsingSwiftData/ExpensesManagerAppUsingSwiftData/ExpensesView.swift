//
//  ContentView.swift
//  ExpensesManagerAppUsingSwiftData
//
//  Created by Shaik Areef on 13/03/25.
//

import SwiftUI
import SwiftData

struct ExpensesView: View {
    @Environment(\.modelContext) var context
    @State var isShowingItemSheet = false
    @Query(sort: \ExpenseModel.date) var expenses : [ExpenseModel]
    @State var expenseToedit : ExpenseModel?
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(expenses){ expense in
                    ExpensesRow(expense:expense)
                        .onTapGesture {
                            expenseToedit = expense
                        }
                }
                .onDelete{ indexset in
                    for index in indexset{
                        context.delete(expenses[index])
                    }
                }
            }
            .navigationTitle("Expenses")
            .navigationBarTitleDisplayMode(.large)
            .sheet(isPresented: $isShowingItemSheet){ AddExpenseSheet() }
            .sheet(item: $expenseToedit){ expense in
                UpdateExpenseSheet(expense: expense)
            }
            .toolbar{
                if !expenses.isEmpty{
                    Button("Add Expenses", systemImage: "plus"){
                        isShowingItemSheet = true
                    }
                }
            }
            .overlay{
                if expenses.isEmpty{
                    ContentUnavailableView(label: {
                        Label("No Expenses", systemImage: "list.bullet.rectangle.portrait")
                    },description: {
                        Text("Start adding expenses to see your list")
                    }, actions: {
                        Button("Add Expense"){isShowingItemSheet = true}
                    })
                    .offset(y: -60)
                }
            }
        }
    }
}

struct ExpensesRow: View {
    
    var expense: ExpenseModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 16){
            Text(expense.name)
            Text(expense.date, style: .date)
            Text(expense.price, format: .currency(code: "INR"))
        }
    }
}

struct AddExpenseSheet: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var name: String = ""
    @State private var date: Date = .now
    @State private var price: Double = 0
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Expense Name", text: $name)
                DatePicker("Date", selection: $date, displayedComponents: .date)
                TextField("Value", value: $price, format: .currency(code: "INR"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("New Expense")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Cancel") { dismiss() }
                }
                
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Save") {
                        // Save code goes here
                        let expense = ExpenseModel(name: name, date: date, price: price)
                        context.insert(expense)
//                        try! context.save()
                        dismiss()
                    }
                }
            }
        }
    }
}

struct UpdateExpenseSheet: View {
//    @Environment(\.modelContext) var context
    @Environment(\.dismiss) private var dismiss
    @Bindable var expense : ExpenseModel
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Expense Name", text: $expense.name)
                DatePicker("Date", selection: $expense.date, displayedComponents: .date)
                TextField("Value", value: $expense.price, format: .currency(code: "INR"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("New Expense")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
}

#Preview {
    ExpensesView()
}
