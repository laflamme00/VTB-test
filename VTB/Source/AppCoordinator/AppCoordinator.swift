//
//  AppCoordinator.swift
//  VTB
//
//  Created by admin on 27.12.2021.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    func start()
}

final class AppCoordinator: NSObject, Coordinator {
    
    private let window: UIWindow
    private let pageViewController = UIPageViewController(transitionStyle: .scroll,
                                                          navigationOrientation: .horizontal,
                                                          options: nil)
    
    private let contentFetcher: GetContentServiceProtocol = GetContentService(networkService: NetworkService())
    private var contentViewControllers = [ContentViewController]()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        getContent { [weak self] viewControllers in
            self?.window.rootViewController = self?.setupPageViewController(viewControllers: viewControllers)
            self?.window.makeKeyAndVisible()
        }
    }
    
    private func setupPageViewController(viewControllers: [ContentViewController]) -> UIPageViewController {
        pageViewController.delegate = self
        pageViewController.dataSource = self
        pageViewController.setViewControllers([viewControllers[0]], direction: .forward, animated: true)
        
        return pageViewController
    }
    
    private func getContent(completion: @escaping ([ContentViewController]) -> Void) {
        contentFetcher.getContent { [weak self] result in
            switch result {
            case .success(let response):
                
                guard let response = response else { return }
                
                let urlStrings = [response.results.single,
                                  response.results.src,
                                  response.results.splitH,
                                  response.results.splitV]
                
                let videoUrls = urlStrings.compactMap { URL(string: $0) }
                let contentVCs = videoUrls.compactMap { self?.createContentVC(with: $0) }
                
                completion(contentVCs)
                
            case .failure(_):
                return
            }
        }
    }
    
    private func createContentVC(with url: URL) -> ContentViewController {
        let viewController = ContentViewController()
        let viewModel = ContentViewModel()
        viewController.viewModel = viewModel
        viewModel.viewController = viewController
        viewModel.videoUrl = url
        viewModel.getVideo()
        
        contentViewControllers.append(viewController)
        
        return viewController
    }
}

extension AppCoordinator: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let last = contentViewControllers[contentViewControllers.count - 1]
        
        guard let index = contentViewControllers.firstIndex(of: viewController as! ContentViewController),
              index > 0 else { return last }
        
        let before = index - 1
        
        return contentViewControllers[before]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let first = contentViewControllers[0]
        
        guard let index = contentViewControllers.firstIndex(of: viewController as! ContentViewController),
              index < (contentViewControllers.count - 1) else { return first }
        
        let after = index + 1
        
        return contentViewControllers[after]
    }
}
