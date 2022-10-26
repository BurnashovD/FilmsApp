//
//  FilmInfoTableViewController.swift
//  FilmsApp
//
//  Created by Daniil on 26.10.2022.
//

import UIKit

final class FilmInfoTableViewController: UITableViewController {
    
    private let cellTypes: [CellTypes] = [.images, .overview, .actors]
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Private methods
    private func configUI() {
        title = "Крестный отец"
        navigationController?.navigationBar.largeTitleTextAttributes =
        [NSAttributedString.Key.foregroundColor: UIColor.white,
         NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30, weight: .bold)]
        view.backgroundColor = UIColor(named: "blueView")
        configCell()
    }
    
    private func configCell() {
        tableView.register(TrailerTableViewCell.self, forCellReuseIdentifier: "trailer")
        tableView.register(OverviewTableViewCell.self, forCellReuseIdentifier: "overview")
        tableView.register(ActorsTableViewCell.self, forCellReuseIdentifier: "actors")
    }
}

extension FilmInfoTableViewController {
    enum CellTypes {
        case images
        case overview
        case actors
    }
}


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
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "trailer", for: indexPath) as? TrailerTableViewCell else { return UITableViewCell() }

            return cell
        case .overview:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "overview", for: indexPath) as? OverviewTableViewCell else { return UITableViewCell() }

            return cell
        case .actors:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "actors", for: indexPath) as? ActorsTableViewCell else { return UITableViewCell() }
            
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
