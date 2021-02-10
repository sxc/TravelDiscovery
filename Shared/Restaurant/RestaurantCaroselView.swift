//
//  RestaurantCaroselView.swift
//  TravelDiscovery
//
//  Created by Xiaochun Shen on 2021/2/10.
//

import SwiftUI
import Kingfisher

struct RestaurantCaroselView: UIViewControllerRepresentable {
    
    let imageName: [String]
    
    let selectedIndex: Int
    
    
    func makeUIViewController(context: Context) -> UIViewController {

        let pvc = CaroselPageViewController(imageName: imageName, selectedIndex: selectedIndex)
        return pvc
    }
    
    typealias UIViewControllerType = UIViewController
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
 
}

class CaroselPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        allControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        self.selectedIndex
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = allControllers.firstIndex(of: viewController) else { return nil }
    
        if index == 0 { return nil }
        return allControllers[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let index = allControllers.firstIndex(of: viewController) else { return nil }
    
        if index == allControllers.count - 1 { return nil }
        return allControllers[index + 1]
    }
    
    var allControllers: [UIViewController] = []
    
    var selectedIndex: Int
    
    init(imageName: [String], selectedIndex: Int) {
        
        self.selectedIndex = selectedIndex
        
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.systemGray5
        UIPageControl.appearance().currentPageIndicatorTintColor = .purple
        
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        allControllers = imageName.map({
            imageName in
            let hostingController = UIHostingController(rootView:
                                                            ZStack {
                                                                Color.black
                                                                KFImage(URL(string: imageName))
                                                                .resizable()
                                                                .scaledToFit()
                                                            }
                                                            
            )
            hostingController.view.clipsToBounds = true
                    
            return hostingController
        })
        
        if selectedIndex < allControllers.count {
            setViewControllers([allControllers[selectedIndex]], direction: .forward, animated: true, completion: nil)
            
        }
        
      
//        if let first = allControllers.first {
//            setViewControllers([allControllers.first!], direction: .forward, animated: true, completion: nil)
//        }
//        
        
 
        
        self.dataSource = self
        self.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


