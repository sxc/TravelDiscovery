//
//  DestinationHeaderContainer.swift
//  TravelDiscovery (iOS)
//
//  Created by Xiaochun Shen on 2021/2/8.
//

import SwiftUI

struct DestinationHeaderContainer: UIViewControllerRepresentable {
    
    let imageName: [String]
    
    
    func makeUIViewController(context: Context) -> UIViewController {

        let pvc = CustomPageViewController(imageName: imageName)
        return pvc
    }
    
    typealias UIViewControllerType = UIViewController
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
 
}

class CustomPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        allControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        0
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
    
    
//    let firstVC = UIHostingController(rootView: Text("First View Controller"))
//    let secondVC = UIHostingController(rootView: Text("Second"))
//    let thirdVC = UIHostingController(rootView: Text("Third"))
//
//    lazy var allControllers: [UIViewController] = [firstVC, secondVC, thirdVC]
    
    
    var allControllers: [UIViewController] = []
    
    
    init(imageName: [String]) {
        
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.systemGray5
        UIPageControl.appearance().currentPageIndicatorTintColor = .purple
        
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
//        view.backgroundColor = .blue
        
        allControllers = imageName.map({
            imageName in
            let hostingController = UIHostingController(rootView:
                Image(imageName)
                                                            .resizable()
                                                            .scaledToFill()
            )
            hostingController.view.clipsToBounds = true
                    
            return hostingController
        })
        
        setViewControllers([allControllers.first!], direction: .forward, animated: true, completion: nil)
        
        self.dataSource = self
        self.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


struct DestinationHeaderContainer_Previews: PreviewProvider {
    static var previews: some View {
       
        DestinationHeaderContainer(imageName: ["eiffel_tower", "japan"])
        
        NavigationView {
            PopularDestinationDetailsView(destination: .init(name: "Paris", country: "France", imageName: "eiffel_tower", latitude: 48.85956, longitude: 2.353235))
        }
        
       
    }
}