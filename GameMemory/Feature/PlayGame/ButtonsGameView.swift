//
//  ButtonsGameView.swift
//  GameMemory
//
//  Created by Douglas  Rodrigues  on 25/04/23.
//

import UIKit

protocol ButtonsGameViewDelegate: AnyObject {
    func selectButtonNumber(number: Int)
}

class ButtonsGameView: UIView {
   
    // MARK: - Properties
    
    private let cell = "cell"
    private var playGame: [PlayGameModel] = []
    weak var delegate: ButtonsGameViewDelegate?
    
    lazy var collectionViewGames: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout.init())
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .none
        cv.register(ButtonsGameCell.self, forCellWithReuseIdentifier: cell)
        let cf: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        cf.scrollDirection = .vertical
        cv.setCollectionViewLayout(cf, animated: false)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Function
    
    private func setupLayout() {
        addSubview(collectionViewGames)
        
        NSLayoutConstraint.activate([
            collectionViewGames.topAnchor.constraint(equalTo: topAnchor),
            collectionViewGames.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionViewGames.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionViewGames.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setupData(game: [PlayGameModel]) {
        playGame = game
        collectionViewGames.reloadData()
    }
}

// MARK: - UICollectionViewDelegate

extension ButtonsGameView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return playGame.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cell, for: indexPath) as! ButtonsGameCell
        
        //cell.setupData(setup: playGame[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.selectButtonNumber(number: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
}
