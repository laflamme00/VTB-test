//
//  ContentLoadingView.swift
//  VTB
//
//  Created by admin on 28.12.2021.
//

import Foundation
import UIKit

final class ContentLoadingView: UIView {
    
    private let loadView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLoadView()
    }
    
    func startAnimating() {
        loadView.startAnimating()
    }
    
    func stopAnimating() {
        loadView.stopAnimating()
    }
    
    func setupOnSuperview(view: UIView) {
        view.addSubview(self)
        
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func setupLoadView() {
        addSubview(loadView)
        
        loadView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loadView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
