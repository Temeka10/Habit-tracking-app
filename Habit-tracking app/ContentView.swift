//
//  ContentView.swift
//  Habit-tracking app
//
//  Created by Artem Mandych on 28.05.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAddHabit = false
    @StateObject var habits = Habits()
   
    var body: some View {
       
        NavigationView {
            ZStack {
                GeometryReader { geo in
                    Image("background")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: geo.size.width * 1, maxHeight: geo.size.height * 2)
                        .ignoresSafeArea()
                }
                VStack {
                    List {
                        ForEach(0..<habits.items.count, id: \.self) { item in
                            NavigationLink {
                                HabitView(index: item, description: habits)
                            } label: {
                                HStack {
                                    VStack(alignment: .leading, spacing: 0) {
                                        
                                        Text(" \(habits.items[item].title)")
                                            .font(.headline.weight(.bold))
                                        
                                        Text("\(habits.items[item].description)")
                                            .font(.subheadline)
                                        
                                        
                                    }
                                    
                                    
                                    
                                    Spacer()
                                    Text("Streak: \(habits.items[item].count)")
                                        .font(.headline)
                                        .padding(15)
                                        .background(.ultraThickMaterial)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                    
                                    
                                    
                                }
                            }
                        }
                        .onDelete(perform: removeItems)
                        .listRowSeparator(.hidden)
                        .listRowBackground(  Rectangle()
                            .fill(.ultraThinMaterial)
                            .frame(width: 370, height: 80)
                            .clipShape(RoundedRectangle(cornerRadius: 10)))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(.white, lineWidth: 5)
                                .frame(width: 370, height: 80)
                            
                        )
                        
                       
                    }
                    .listStyle(.plain)
                    .toolbar {
                        Button {
                            showingAddHabit = true
                        } label: {
                            Image(systemName: "plus")
                                .padding(5)
                                .background(.thickMaterial)
                                .clipShape(Circle())
                        }
                        .sheet(isPresented: $showingAddHabit) {
                            AddView(habits: habits)
                        }
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("Habits Tracker😼")
                    
                }
            }
        }
    }
    func removeItems(_ offsets: IndexSet) {
        habits.items.remove(atOffsets: offsets)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
