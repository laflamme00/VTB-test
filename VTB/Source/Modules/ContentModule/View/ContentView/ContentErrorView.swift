//
//  ContentErrorView.swift
//  VTB
//
//  Created by admin on 27.12.2021.
//

import Foundation
import UIKit

final class ContentErrorView: UIView {
    
    private let errorStatusCodeView: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.tintColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 100, weight: .bold)
        
        return label
    }()
    
    private let errorTitleView: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.tintColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        
        return label
    }()
    
    private let errorDescriptionView: UILabel = {
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
        errorStatusCodeView.text = errorModel.statusCode
        errorTitleView.text = errorModel.title
        errorDescriptionView.text = errorModel.description
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
        addSubview(errorStatusCodeView)
        
        errorStatusCodeView.topAnchor.constraint(equalTo: topAnchor, constant: 150).isActive = true
        errorStatusCodeView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        errorStatusCodeView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
    }
    
    private func setupErrorTitleView() {
        addSubview(errorTitleView)
        
        errorTitleView.topAnchor.constraint(equalTo: errorStatusCodeView.bottomAnchor, constant: 20).isActive = true
        errorTitleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        errorTitleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    }
    
    private func setupErrorDescriptionView() {
        addSubview(errorDescriptionView)
        
        errorDescriptionView.topAnchor.constraint(equalTo: errorTitleView.bottomAnchor, constant: 20).isActive = true
        errorDescriptionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        errorDescriptionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        errorDescriptionView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -50).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
