//
//  TrendingCreatorsView.swift
//  TravelDiscovery
//
//  Created by Xiaochun Shen on 2021/2/4.
//

import SwiftUI

struct TrendingCreatorsView: View {
    
    let users: [User] = [
        .init(name: "Amy Adams", imageName: "amy"),
        .init(name: "Billy", imageName: "billy"),
        .init(name: "Sam Smith", imageName: "sam")
    ]
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
                HStack(alignment: .top, spacing: 12) {
                    ForEach(users, id: \.self) { user in
                        VStack {
                            VStack {
                                Image(user.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 60)
                                
                                    .cornerRadius(60)
                                Text(user.name)
                                    .font(.system(size: 12, weight: .semibold))
                                    .multilineTextAlignment(.center)
                                
                                
                            }
                                
                            .clipped()
//                                .background(Color(.init(white: 0.9, alpha: 1)))
                           
//                                .cornerRadius(.infinity)
                                .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
                                .padding(.bottom)
                    }
                }.padding(.horizontal)
            }
        }
    }
}
}

struct TrendingCreatorsView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingCreatorsView()
    }
}
