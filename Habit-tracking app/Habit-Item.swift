//
//  Habit-Item.swift
//  Habit-tracking app
//
//  Created by Artem Mandych on 28.05.2023.
//

import Foundation


struct HabitItem: Identifiable, Codable{
    var id = UUID()
    let title: String
    let description: String
    let count: Int
}
