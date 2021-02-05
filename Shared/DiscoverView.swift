//
//  ContentView.swift
//  Shared
//
//  Created by Xiaochun Shen on 2021/2/3.
//

import SwiftUI

extension Color {
    static let discoverBackground = Color(.init(white: 0.95, alpha: 1))
}

struct DiscoverView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
    }
    
    var body: some View {
        NavigationView {
            
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9877904058, green: 0.6676721573, blue: 0.03594115749, alpha: 1)), Color(#colorLiteral(red: 0.9759785533, green: 0.5468072295, blue: 0.1052567586, alpha: 1))]), startPoint: .top, endPoint: .center)
                    .ignoresSafeArea()
                
                Color.discoverBackground
                    .offset(y: 400)
                
                ScrollView {
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Text("Where do you want to go?")
                            Spacer()
                            
                    }
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                    .padding()
                    
                    .background(Color.discoverBackground)
                    .cornerRadius(10)
                    .padding(16)
                    
                    DiscoverCategoriesView()
                    
                    VStack {
                        PopularDestinationsView()
                        
                        PopularRestaurantsView()
                        
                        TrendingCreatorsView()
                    }.background(Color(.init(white: 0.95, alpha: 1)))
                    .cornerRadius(16)
                    .padding(.top, 32)
                    
                    
                    
                }
            }
            
                .navigationTitle("Discover")
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
