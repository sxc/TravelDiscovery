//
//  DestinationHeaderContainer.swift
//  TravelDiscovery (iOS)
//
//  Created by Xiaochun Shen on 2021/2/8.
//

import SwiftUI

struct DestinationHeaderContainer: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
//        let redVC = UIHostingController(rootView: Text("First View Controller"))
//        redVC.view.backgroundColor = .green
//        return redVC
        
        let pvc = CustomPageViewController()
        return pvc
    }
    
    typealias UIViewControllerType = UIViewController
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
 
}

class CustomPageViewController: UIPageViewController, UIPageViewControllerDataSource {
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
    
    
    let firstVC = UIHostingController(rootView: Text("First View Controller"))
    let secondVC = UIHostingController(rootView: Text("Second"))
    let thirdVC = UIHostingController(rootView: Text("Third"))
    
    lazy var allControllers: [UIViewController] = [firstVC, secondVC, thirdVC]
    
    
    init() {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        view.backgroundColor = .blue
        
        setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        
        self.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


struct DestinationHeaderContainer_Previews: PreviewProvider {
    static var previews: some View {
        DestinationHeaderContainer()
    }
}
