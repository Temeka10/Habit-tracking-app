//
//  HabitView.swift
//  Habit-tracking app
//
//  Created by Artem Mandych on 29.05.2023.
//

import SwiftUI

struct HabitView: View {
    var index: Int
    @ObservedObject var description: Habits
    var body: some View {
            ZStack {
                GeometryReader { geo in
                    Image("background2")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: geo.size.width * 1 , maxHeight: geo.size.height * 2)
                        .ignoresSafeArea()
                    VStack {
                      HabitForm(index: index, description: description)
                    }
                }
            }
            .navigationTitle(Text(description.items[index].title))
        }
    }


struct HabitView_Previews: PreviewProvider {
    static var previews: some View {
        HabitView(index: 1,  description: Habits())
    }
}
