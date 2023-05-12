//
//  ButtonsGameCell.swift
//  GameMemory
//
//  Created by Douglas  Rodrigues  on 26/04/23.
//

import UIKit

class ButtonsGameCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    lazy var flashMemory: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    private func setupLayout() {
        
        addSubview(flashMemory)
        
        NSLayoutConstraint.activate([
            flashMemory.topAnchor.constraint(equalTo: topAnchor),
            flashMemory.leadingAnchor.constraint(equalTo: leadingAnchor),
            flashMemory.trailingAnchor.constraint(equalTo: trailingAnchor),
            flashMemory.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
