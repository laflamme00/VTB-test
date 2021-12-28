//
//  ContentErrorView.swift
//  VTB
//
//  Created by admin on 27.12.2021.
//

import Foundation
import UIKit

final class ContentErrorView: UIView {
    
    private let errorStatusCodeLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.tintColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 100, weight: .bold)
        
        return label
    }()
    
    private let errorTitleLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.tintColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        
        return label
    }()
    
    private let errorDescriptionLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.tintColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setTitles(errorModel: ErrorModel) {
        errorStatusCodeLabel.text = errorModel.statusCode
        errorTitleLabel.text = errorModel.title
        errorDescriptionLabel.text = errorModel.description
    }
    
    func setupOnSuperview(view: UIView) {
        view.addSubview(self)
        
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150).isActive = true
        bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -150).isActive = true
        leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
    }
    
    private func setupViews() {
        setupErrorStatusCodeView()
        setupErrorTitleView()
        setupErrorDescriptionView()
    }
    
    private func setupErrorStatusCodeView() {
        addSubview(errorStatusCodeLabel)
        
        errorStatusCodeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 150).isActive = true
        errorStatusCodeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        errorStatusCodeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
    }
    
    private func setupErrorTitleView() {
        addSubview(errorTitleLabel)
        
        errorTitleLabel.topAnchor.constraint(equalTo: errorStatusCodeLabel.bottomAnchor, constant: 20).isActive = true
        errorTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        errorTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    }
    
    private func setupErrorDescriptionView() {
        addSubview(errorDescriptionLabel)
        
        errorDescriptionLabel.topAnchor.constraint(equalTo: errorTitleLabel.bottomAnchor, constant: 20).isActive = true
        errorDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        errorDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        errorDescriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -50).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
