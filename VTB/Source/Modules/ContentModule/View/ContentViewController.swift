//
//  ContentViewController.swift
//  VTB
//
//  Created by admin on 25.12.2021.
//

import UIKit
import AVKit

protocol ContentDisplayLogic: AnyObject {
    
    var state: ContentViewState { get set }
    
    func playVideo(url: URL)
}

final class ContentViewController: UIViewController, ContentDisplayLogic {
    
    var viewModel: ContentBusinessLogic?
    
    var state: ContentViewState = .preparingForVideo {
        didSet {
            setupContentView()
        }
    }
    
    private var contentView = ContentView()
    private var errorView = ContentErrorView()
    private let loadingView = ContentLoadingView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupView()
    }
    
    func playVideo(url: URL) {
        let player = AVPlayer(url: url)
        let playerVC = AVPlayerViewController()
        playerVC.player = player

        present(playerVC, animated: true) {
            playerVC.player?.play()
        }
    }
    
    private func setupView() {
        view.backgroundColor = .secondarySystemBackground
        setupContentView()
    }
    
    private func setupTapGesture() {
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(playTapped))
        self.contentView.addGestureRecognizer(gesture)
    }
    
    private func setupContentView() {
        switch state {
        case .preparingForVideo:
            loadingView.startAnimating()
            loadingView.setupOnSuperview(view: view)
            viewModel?.getVideo()
            
        case .processingURL:
            loadingView.startAnimating()
            loadingView.setupOnSuperview(view: view)
            
        case .readyForPlay(let image):
            loadingView.stopAnimating()
            loadingView.removeFromSuperview()
            contentView.setThumbail(image: image)
            contentView.setupOnSuperview(view: view)
            setupTapGesture()
            
        case .errorURL(let errorModel):
            loadingView.stopAnimating()
            loadingView.removeFromSuperview()
            errorView.setTitles(errorModel: errorModel)
            errorView.setupOnSuperview(view: view)
        }
    }
    
    @objc func playTapped(sender : UITapGestureRecognizer) {
        viewModel?.playVideo()
    }
}
