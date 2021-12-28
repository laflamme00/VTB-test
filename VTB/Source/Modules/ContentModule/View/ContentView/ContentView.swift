//
//  ContentView.swift
//  VTB
//
//  Created by admin on 27.12.2021.
//

import Foundation
import UIKit

final class ContentView: UIView {
    
    private enum Constants {
        static let externalVerticalOffset: CGFloat = 50
        static let externalHorizontalOffset: CGFloat = 20
        
        static let internalVerticalOffset: CGFloat = 50
        static let internalOffsets: CGFloat = 20
        
        static let iconHeight: CGFloat = 100
    }
    
    private let thumbnailImage: UIImageView = {
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .clear
        
        return image
    }()
    
    private let playIconImage: UIImageView = {
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
        topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.externalVerticalOffset).isActive = true
        bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Constants.externalVerticalOffset).isActive = true
        leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.externalHorizontalOffset).isActive = true
        trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Constants.externalHorizontalOffset).isActive = true
    }
    
    func setThumbnail(image: UIImage) {
        thumbnailImage.image = image
    }
    
    private func setupViews() {
        setupThumbnailView()
        setupPlayIconView()
    }
    
    private func setupPlayIconView() {
        thumbnailImage.addSubview(playIconImage)
        
        playIconImage.heightAnchor.constraint(equalToConstant: Constants.iconHeight).isActive = true
        playIconImage.widthAnchor.constraint(equalToConstant: Constants.iconHeight).isActive = true
        playIconImage.centerYAnchor.constraint(equalTo: thumbnailImage.centerYAnchor).isActive = true
        playIconImage.centerXAnchor.constraint(equalTo: thumbnailImage.centerXAnchor).isActive = true
    }
    
    private func setupThumbnailView() {
        addSubview(thumbnailImage)
        
        thumbnailImage.topAnchor.constraint(equalTo: topAnchor, constant: .zero).isActive = true
        thumbnailImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: .zero).isActive = true
        thumbnailImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .zero).isActive = true
        thumbnailImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: .zero).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
