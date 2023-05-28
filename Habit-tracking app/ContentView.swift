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
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
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
                        ForEach(habits.items) { item in
                            NavigationLink {
                                
                            } label: {
                                HStack {
                                    VStack(alignment: .leading, spacing: 0) {
                                        
                                        Text(" \(item.title)")
                                            .font(.headline.weight(.bold))
                                        
                                        Text("\(item.description)")
                                            .font(.subheadline)
                                        
                                        
                                    }
                                    
                                    
                                    
                                    Spacer()
                                    Text("Streak: \(item.count)")
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
    func removeItems(at offsets: IndexSet) {
        habits.items.remove(atOffsets: offsets)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
