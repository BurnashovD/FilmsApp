//
//  FilmInfoTableViewController.swift
//  FilmsApp
//
//  Created by Daniil on 26.10.2022.
//

import UIKit

// Класс отвечает за информацию о выбранном фильме
final class FilmInfoTableViewController: UITableViewController {
    
    // MARK: - Private properties
    private let cellTypes: [CellTypes] = [.images, .overview, .actors]
    
    // MARK: - Public properties
    var selectedFilmOverviewText = ""
    var posterimage = UIImage()
    var filmId = ""
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Private methods
    private func configUI() {
        navigationController?.navigationBar.largeTitleTextAttributes =
        [NSAttributedString.Key.foregroundColor: UIColor.white,
         NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30, weight: .bold)]
        view.backgroundColor = UIColor(named: Constants.blueViewColorName)
        configCell()
    }
    
    private func configCell() {
        tableView.register(TrailerTableViewCell.self, forCellReuseIdentifier: Constants.trailerCellIdentifier)
        tableView.register(OverviewTableViewCell.self, forCellReuseIdentifier: Constants.overviewCellIdentifier)
        tableView.register(ActorsTableViewCell.self, forCellReuseIdentifier: Constants.actorsCellIdentifier)
    }
}

/// Constants and CellTypes
extension FilmInfoTableViewController {
    enum Constants {
        static let blueViewColorName = "blueView"
        static let trailerCellIdentifier = "trailer"
        static let overviewCellIdentifier = "overview"
        static let actorsCellIdentifier = "actors"
    }
    
    enum CellTypes {
        case images
        case overview
        case actors
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension FilmInfoTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type = cellTypes[indexPath.section]
        switch type {
        case .images:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.trailerCellIdentifier, for: indexPath) as? TrailerTableViewCell else { return UITableViewCell() }
            cell.secondFilmImageView.image = posterimage
            
            cell.sendOpenWebPageAction = {
                let trailerWebPageVC = TrailerWebPageViewController()
                self.present(trailerWebPageVC, animated: true)
            }
            return cell
            
        case .overview:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.overviewCellIdentifier, for: indexPath) as? OverviewTableViewCell else { return UITableViewCell() }
            cell.overviewLabel.text = selectedFilmOverviewText

            return cell
            
        case .actors:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.actorsCellIdentifier, for: indexPath) as? ActorsTableViewCell else { return UITableViewCell() }
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let type = cellTypes[indexPath.section]
        switch type {
        case .actors:
            return 130
        default:
            return UITableView.automaticDimension
        }
    }
}
