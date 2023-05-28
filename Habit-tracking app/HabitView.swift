//
//  HabitView.swift
//  Habit-tracking app
//
//  Created by Artem Mandych on 29.05.2023.
//

import SwiftUI

struct HabitView: View {
    @ObservedObject var description: Habits
    var body: some View {
        NavigationView {
            Form {
                Section {
                    ForEach(description.items) { item in
                        Text(item.description)
                    }
                }
                
            }
        }
    }
}

struct HabitView_Previews: PreviewProvider {
    static var previews: some View {
        HabitView(description: Habits())
    }
}
