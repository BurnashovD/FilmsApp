//
//  ActorsCollectionViewCell.swift
//  FilmsApp
//
//  Created by Daniil on 26.10.2022.
//

import UIKit

class ActorsCollectionViewCell: UICollectionViewCell {
    let actorName: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12, weight: .heavy)
        label.textAlignment = .center
        label.text = "Eric Makgover"
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    let actorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "anime")
        imageView.layer.cornerRadius = 30
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(actorName)
        contentView.addSubview(actorImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        createLabelAnchors()
        createImageViewAnchors()
    }
    
    private func createLabelAnchors() {
        actorName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        actorName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        actorName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 15).isActive = true
    }
    
    private func createImageViewAnchors() {
        actorImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        actorImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2).isActive = true
        actorImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2).isActive = true
//        actorImageView.bottomAnchor.constraint(equalTo: actorName.topAnchor, constant: 0).isActive = true
        actorImageView.heightAnchor.constraint(equalToConstant: 90).isActive = true
    
    }
    
}
