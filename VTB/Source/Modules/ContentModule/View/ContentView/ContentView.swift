//
//  ContentView.swift
//  VTB
//
//  Created by admin on 27.12.2021.
//

import Foundation
import UIKit

final class ContentView: UIView {
    
    private let thumbailView: UIImageView = {
        let view = UIImageView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .clear
        
        return view
    }()
    
    private let playIconView: UIImageView = {
        let view = UIImageView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.tintColor = .gray
        view.image = UIImage(systemName: "play")
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupOnSuperview(view: UIView) {
        view.addSubview(self)
        
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150).isActive = true
        bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -150).isActive = true
        leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
    }
    
    func setThumbail(image: UIImage) {
        thumbailView.image = image
    }
    
    private func setupViews() {
        setupThumbailView()
        setupPlayIconView()
    }
    
    private func setupPlayIconView() {
        thumbailView.addSubview(playIconView)
        
        playIconView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        playIconView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        playIconView.centerYAnchor.constraint(equalTo: thumbailView.centerYAnchor).isActive = true
        playIconView.centerXAnchor.constraint(equalTo: thumbailView.centerXAnchor).isActive = true
    }
    
    private func setupThumbailView() {
        addSubview(thumbailView)
        
        thumbailView.topAnchor.constraint(equalTo: topAnchor, constant: .zero).isActive = true
        thumbailView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: .zero).isActive = true
        thumbailView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .zero).isActive = true
        thumbailView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: .zero).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
