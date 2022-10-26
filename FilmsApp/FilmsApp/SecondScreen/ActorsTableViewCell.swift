//
//  ActorsTableViewCell.swift
//  FilmsApp
//
//  Created by Daniil on 26.10.2022.
//

import UIKit

final class ActorsTableViewCell: UITableViewCell {
    
    let actorsCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 1, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsHorizontalScrollIndicator = false
        collection.backgroundColor = UIColor(named: "blueView")
        
//        collection.backgroundColor = .red
        return collection
    }()
    
    let d: UILabel = {
        let label = UILabel()
//        label.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        label.backgroundColor = .gray
        label.text = "HAHAHA"
        return label
    }()
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        configUI()
    }

    private func configUI() {
        backgroundColor = UIColor.gray
        actorsCollectionView.delegate = self
        actorsCollectionView.dataSource = self
        actorsCollectionView.register(ActorsCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        contentView.addSubview(actorsCollectionView)
        createCollectionViewAnchors()
    }
    
    private func createCollectionViewAnchors() {
        actorsCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        actorsCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        actorsCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        actorsCollectionView.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 1).isActive = true
        actorsCollectionView.heightAnchor.constraint(equalToConstant: 140).isActive = true
    }
}


extension ActorsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ActorsCollectionViewCell else { return UICollectionViewCell() }
//        cell.backgroundColor = .red
        
        
        return cell
    }
    
    
}
