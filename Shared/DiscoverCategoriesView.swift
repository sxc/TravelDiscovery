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
        .init(name: "Food", imageName: "tray.fill"),
        .init(name: "History", imageName: "books.vertical.fill"),
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(alignment: .top, spacing: 16) {
                ForEach(categories, id: \.self) { category in
                    NavigationLink(
                        destination: CategoryDetialsView(),
                        label: {
                            
                            VStack(spacing: 8) {
                                Image(systemName: category.imageName)
                                    .font(.system(size: 20))
                                    .foregroundColor(Color(#colorLiteral(red: 0.987332046, green: 0.6559622288, blue: 0.0520754382, alpha: 1)))
                                    .frame(width: 64, height: 64)
                                    .background(Color.white)
                                    .cornerRadius(64)
                                Text(category.name)
                                    .font(.system(size: 12, weight: .semibold))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                            }.frame(width: 68)
                            
                        })
                    
                }
                
            }.padding(.horizontal)
            
        }
    }
}





class CategoryDetailsViewModel: ObservableObject {
    
    @Published var isLoading = true
    @Published var places = [Place]()
    @Published var errorMessage = ""
    
    init() {
        // network code will happen here
        
        // real network cod
        
        guard let url = URL(string:
                                "https://travel.letsbuildthatapp.com/travel_discovery/category?name=art") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            // you want to check resp statusCodde and err
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                
                guard let data = data else { return }
                do {
                    
                    self.places = try JSONDecoder().decode([Place].self, from: data)
                } catch {
                    print("Failed to decode JSON:", error)
                    self.errorMessage = error.localizedDescription
                    
                }
                
                self.isLoading = false
//                self.places = [1]
            }
            
        }.resume()
        
        }
    }






struct DiscoverCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
        
//        NavigationView {
//            NavigationLink(
//                destination: Text("Transition Screen"),
//                label: {
//                    Text("Link")
//                })
        }
        
//        ZStack {
//            Color.orange
//            DiscoverCategoriesView()
//        }
}
