//
//  DiscoverCategoriesView.swift
//  TravelDiscovery
//
//  Created by Xiaochun Shen on 2021/2/4.
//

import SwiftUI

struct DiscoverCategoriesView: View {
    
    let categories: [Category] = [
        .init(name: "Art", imageName: "paintpalette.fill"),
        .init(name: "Sport", imageName: "sportscourt.fill"),
        .init(name: "Live Events", imageName: "music.mic"),
        .init(name: "Food", imageName: "music.mic"),
        .init(name: "History", imageName: "music.mic"),
        .init(name: "Live Events", imageName: "music.mic"),
        .init(name: "Live Events", imageName: "music.mic"),
        
            
        
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(alignment: .top, spacing: 16) {
                ForEach(categories, id: \.self) { category in
                    VStack(spacing: 8) {
                        Image(systemName: category.imageName)
                            .font(.system(size: 20))
                            .foregroundColor(Color(#colorLiteral(red: 0.987332046, green: 0.6559622288, blue: 0.0520754382, alpha: 1)))
                            .frame(width: 64, height: 64)
                            .background(Color.white)
                            .cornerRadius(64)
//                             .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
                        Text(category.name)
                            .font(.system(size: 12, weight: .semibold))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                    }.frame(width: 68)
                    
                }
                
            }.padding(.horizontal)
            
        }
    }
}

struct DiscoverCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.orange
            DiscoverCategoriesView()
        }
    }
}
