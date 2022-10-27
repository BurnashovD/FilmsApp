//
//  ActorsCollectionViewCell.swift
//  FilmsApp
//
//  Created by Daniil on 26.10.2022.
//

import UIKit

// Класс отвечает за коллекцию с актерами
final class ActorsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Visual components
    private let actorName: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12, weight: .heavy)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let actorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 30
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var filmId = String()
    var refreshActors: Cast? {
        didSet {
            guard let profPath = refreshActors?.profilePath else { return }
            actorName.text = refreshActors?.originalName
            let imageURL = "http://image.tmdb.org/t/p/w500\(profPath)"
            guard let url = URL(string: imageURL) else { return }
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async() { [weak self] in
                    self?.actorImageView.image = UIImage(data: data)
                }
            }.resume()
        }
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(actorName)
        contentView.addSubview(actorImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError(Constants.errorText)
    }
    
    override func layoutSubviews() {
        createLabelAnchors()
        createImageViewAnchors()
    }
    
    // MARK: - Private methods
    private func createLabelAnchors() {
        actorName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        actorName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        actorName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 15).isActive = true
    }
    
    private func createImageViewAnchors() {
        actorImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        actorImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2).isActive = true
        actorImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2).isActive = true
        actorImageView.heightAnchor.constraint(equalToConstant: 90).isActive = true
    }
}

///  Constants
extension ActorsCollectionViewCell {
    enum Constants {
        static let errorText = "init(coder:) has not been implemented"
    }
}
