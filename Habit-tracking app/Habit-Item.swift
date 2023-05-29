//
//  Habit-Item.swift
//  Habit-tracking app
//
//  Created by Artem Mandych on 28.05.2023.
//

import Foundation


struct HabitItem: Identifiable, Codable, Equatable {
    var id = UUID()
    let title: String
    let description: String
    var date: Date?
    var date2: Date = Date.now
    var count: Int = 0
}
