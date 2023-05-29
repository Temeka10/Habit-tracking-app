//
//  HabitForm.swift
//  Habit-tracking app
//
//  Created by Artem Mandych on 29.05.2023.
//

import SwiftUI

struct HabitForm: View {
    @State private var titleWidth: CGFloat = 250
    @State private var opacity: Double = 1
    @State private var animationAmount = 0.0
    var count: Int {
        let streak = description.items[index].count
        return streak
    }
    var index: Int 
    @ObservedObject var description: Habits
    var body: some View {
            List {
                Section {
                    Text(description.items[index].description)
                } header: {
                    HStack {
                        Spacer()
                        Text("Habit Description:")
                            .padding(10)
                            .font(.headline)
                            .foregroundColor(.black)
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        Spacer()
                    }
                }
                .listRowSeparator(.hidden)
                .listRowBackground(
                    Rectangle()
                        .fill(.thickMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .frame(width: 370)
                        .shadow(radius:10)
                )
                Section {
                    Text("You started on - \(description.items[index].date2.formatted(date: .abbreviated, time: .omitted)) ")
                } header: {
                    HStack {
                        Spacer()
                        Text("Date when habit was created:")
                            .padding(10)
                            .font(.headline)
                            .foregroundColor(.black)
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        Spacer()
                    }
                }
                .listRowSeparator(.hidden)
                .listRowBackground(
                    Rectangle()
                        .fill(.thickMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .frame(width: 370)
                        .shadow(radius:10)
                )
                Section {
                   
                    Text("Last activity - \(description.items[index].date?.formatted(date: .abbreviated, time: .omitted) ?? "N/A")" )
                    
                } header: {
                    HStack {
                        Spacer()
                        Text("Last activity")
                            .padding(10)
                            .font(.headline)
                            .foregroundColor(.black)
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        Spacer()
                    }
                }
                .listRowSeparator(.hidden)
                .listRowBackground(
                    Rectangle()
                        .fill(.thickMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .frame(width: 370)
                        .shadow(radius:10)
                )
                
                Section {
                    HStack(spacing: 130) {
                        Button {
        
                        } label: {
                            Text("Done")
                                .frame(width: 100, height: 60)
                                .background(.red.opacity(0.5))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                        }
                        .onTapGesture {
                            var newdDate = description.items[index].date
                            newdDate = Date.now
                            self.description.items[index].date = newdDate
                            var count = description.items[index].count
                            count += 1
                            self.description.items[index].count = count
                        }
                        Text("Streak: \(description.items[index].count)")
                            .opacity(opacity)
                            .frame(maxWidth: titleWidth, maxHeight: 55)
                            .font(.system(size: 20).bold())
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .transition(.opacity)
                           
                                
                            
                          

                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(
                        Rectangle()
                            .fill(.ultraThinMaterial)
                            .frame(width: 365, height: 70)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(radius: 10)
                        
                    )
                    
                } header: {
                    Text("")
                }
            }
            .listStyle(.plain)
    }
}

struct HabitForm_Previews: PreviewProvider {
    static var previews: some View {
        HabitForm(index: 1, description: Habits())
    }
}
