//
//  AddView.swift
//  Habit-tracking app
//
//  Created by Artem Mandych on 29.05.2023.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var habits: Habits
    @State private var title = ""
    @State private var description = ""
    @State private var count = 0
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $title)
                
                TextField("Description",text: $description)
            }
            .navigationTitle("Add new habit")
            .toolbar {
                Button("Save") {
                    let item = HabitItem(title: title, description: description, count: count)
                    habits.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(habits: Habits())
    }
}
