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
        label.font = UIFont.systemFont(ofSize: 60, weight: .bold)
        
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
        topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.generalVerticalOffset).isActive = true
        bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Constants.generalVerticalOffset).isActive = true
        leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.externalHorizontalOffset).isActive = true
        trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Constants.externalHorizontalOffset).isActive = true
    }
    
    private func setupViews() {
        setupErrorStatusCodeView()
        setupErrorTitleView()
        setupErrorDescriptionView()
    }
    
    private func setupErrorStatusCodeView() {
        addSubview(errorStatusCodeLabel)
        
        errorStatusCodeLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -Constants.generalVerticalOffset).isActive = true
        errorStatusCodeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.internalOffsets).isActive = true
        errorStatusCodeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.internalOffsets).isActive = true
    }
    
    private func setupErrorTitleView() {
        addSubview(errorTitleLabel)
        
        errorTitleLabel.topAnchor.constraint(equalTo: errorStatusCodeLabel.bottomAnchor, constant: Constants.internalOffsets).isActive = true
        errorTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.internalOffsets).isActive = true
        errorTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.internalOffsets).isActive = true
    }
    
    private func setupErrorDescriptionView() {
        addSubview(errorDescriptionLabel)
        
        errorDescriptionLabel.topAnchor.constraint(equalTo: errorTitleLabel.bottomAnchor, constant: Constants.internalOffsets).isActive = true
        errorDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.internalOffsets).isActive = true
        errorDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.internalOffsets).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private enum Constants {
    static let generalVerticalOffset: CGFloat = 50
    static let externalHorizontalOffset: CGFloat = 20
    static let internalOffsets: CGFloat = 20
}
