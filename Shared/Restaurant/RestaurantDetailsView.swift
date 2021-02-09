//
//  RestaurantDetailsView.swift
//  TravelDiscovery (iOS)
//
//  Created by Xiaochun Shen on 2021/2/9.
//

import SwiftUI

struct RestaurantDetailsView: View {
    
    let restaurant: Restaurant
    
    
    var body: some View {
        ScrollView {
            
            ZStack(alignment: .bottomLeading) {
                Image(restaurant.imageName)
                    .resizable()
                    .scaledToFill()
                
                LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]), startPoint: .center, endPoint: .bottom)
                
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(restaurant.name)
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .bold))
                        
                        HStack {
                            ForEach(0..<5, id: \.self) { num in
                                Image(systemName: "star.fill")
                                
                            }.foregroundColor(.orange)
                        }
                    }
                    Spacer()
                    
                    Text("See more photos")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .frame(width: 80)
                        .multilineTextAlignment(.trailing)
                }.padding()
                
            }
            
            VStack(alignment: .leading) {
                Text("Location & Description")
                    .font(.system(size: 16, weight: .bold))
                
                Text("Tokyo, Japan")
                
                HStack {
                    ForEach(0..<5, id: \.self) { num in
                        Image(systemName: "dollarsign.circle.fill")
                        
                    }.foregroundColor(.orange)
                }
                
                Text("dsafdsa fdsafdsa sdfadsafd fdsafdsaf dfsafdsaf dfsafjdlkajfdsa fdsafdsafds fdsafdsafds fdsafdsadsfadsf sdafdsljkjfdsalkfjdslk fdsafjdlsajf dsajklf fdsafds afjds alfjdslakjf ldsaj fldjsalf dlsajfldksjfoijfoiejfdjslfakjdslafjdlsjfljsfkjdsjdfdsjaffdsaljfd lasfjd fjdsljjf dsajfldsja fldjsfl jdsa fdsaljf. one more line dsafds fdsafdsa fdsafd fdsaf fdsafdsa fdafds")
                    .padding(.top, 8)
                    .font(.system(size: 14, weight: .regular))
            }.padding()
            
            HStack {
                Text("Popular Disher")
                    .font(.system(size: 16, weight: .bold))
                Spacer()
                
            } .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(0..<5, id: \.self) { num in
                        VStack {
                            Image("tapas")
                                .resizable()
                                .scaledToFill()
                                .frame(height: 80)
                                .cornerRadius(5)
                                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray))
                                .shadow(radius: 2)
                                .padding(.vertical, 2)
                            
                            Text("Japanese Tapas")
                            Text("88 photos")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                            
                        }
                    }
                }.padding(.horizontal)
            }
        }
        .navigationBarTitle("Restaurant Details", displayMode: .inline)
    }
}
struct RestaurantDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RestaurantDetailsView(restaurant: .init(name: "Japan's finest tapas", imageName: "tapas"))
        }
    }
}
