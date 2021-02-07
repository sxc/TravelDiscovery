//
//  CategoryDetailsView.swift
//  TravelDiscovery
//
//  Created by Xiaochun Shen on 2021/2/7.
//

import SwiftUI

import Kingfisher
import SDWebImageSwiftUI


struct CategoryDetialsView: View {
    
    
    // Where do i perform my network activity code?
    
    @ObservedObject var vm = CategoryDetailsViewModel()
     
    var body: some View {
        
        ZStack {
            if vm.isLoading {
                VStack {
                    ActivityIndicatorView()
                    Text("Loading")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .semibold))
                }
                .padding()
                .background(Color.black)
                
                
            } else {
                
                
                ZStack {
                    Text(vm.errorMessage)
                    ScrollView {
                        ForEach(vm.places, id: \.self) { place in
                            VStack(alignment: .leading, spacing: 0) {
//                                Image("art1")
//                                KFImage(URL(string: place.thumbnail))
                                WebImage(url: URL(string: place.thumbnail))
                                    .resizable()
                                    .indicator(.activity)
                                    .transition(.fade(duration: 0.5))
                                    .scaledToFill()
                                
                                Text(place.name)
                                    .font(.system(size: 12, weight: .semibold))
                                    .padding()
                                    
                            }.asTile()
                            .padding()
                        }
                    }
                }
                }
                
        }
        .navigationBarTitle("Category", displayMode: .inline)
    }
}

struct CategoryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            CategoryDetialsView()
        }
    }
}
