//
//  ContentView.swift
//  Shared
//
//  Created by Xiaochun Shen on 2021/2/3.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                
                DiscoverCategoriesView()
                
                PopularDestinationsView()
                
                PopularRestaurantsView()
                
                TrendingCreatorsView()
                
            }
                .navigationTitle("Discover")
        }
    }
}

struct PopularDestinationsView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Popular destinations")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("See all")
                    .font(.system(size: 12, weight: .semibold))
            }.padding(.horizontal)
            .padding(.top)
            
            ScrollView(.horizontal) {
                
                HStack(spacing: 8.0) {
                    ForEach(0..<5, id: \.self) { num in
                        Spacer()
                            .frame(width: 125, height: 150)
                            .background(Color.gray)
                            .cornerRadius(5)
                            .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
                            .padding(.bottom)
                    }
                }.padding(.horizontal)
            }
        }
    }
}


struct PopularRestaurantsView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Popular places to eat")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("See all")
                    .font(.system(size: 12, weight: .semibold))
            }.padding(.horizontal)
            .padding(.top)
            
            ScrollView(.horizontal) {
                
                HStack(spacing: 8.0) {
                    ForEach(0..<5, id: \.self) { num in
                        Spacer()
                            .frame(width: 200, height: 64)
                            .background(Color.gray)
                            .cornerRadius(5)
                            .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
                            .padding(.bottom)
                    }
                }.padding(.horizontal)
            }
        }
    }
}


struct TrendingCreatorsView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Trending Creators")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("See all")
                    .font(.system(size: 12, weight: .semibold))
            }.padding(.horizontal)
            .padding(.top)
            
            ScrollView(.horizontal) {
                HStack(spacing: 8.0) {
                    ForEach(0..<15, id: \.self) { num in
                        VStack {
                            Spacer()
                                .frame(width: 50, height: 50)
                                .background(Color.gray)
                                .cornerRadius(.infinity)
                                .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
                                .padding(.bottom)
                    }
                }.padding(.horizontal)
            }
        }
    }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DiscoverCategoriesView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 8) {
                ForEach(0..<7, id: \.self) { num in
                    
                    VStack {
                        Spacer()
                            .frame(width: 60, height: 60)
                            .background(Color.gray)
                            .cornerRadius(.infinity)
                            .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
                        Text("Art")
                            .font(.system(size: 12, weight: .semibold))
                    }
                    
                }
                
            }.padding(.horizontal)
            
        }
    }
}
