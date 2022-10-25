// FilmsTableViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class FilmsTableViewController: UITableViewController {
    
    let decoder = JSONDecoder()
    
    var movies = [Result]()
    var movieImage = UIImage()
    var actualURL = "https://api.themoviedb.org/3/movie/top_rated?api_key=56c45ba32cd76399770966658bf65ca0&language=ru-RU&page=1" {
        willSet {
            reformMovies()
            tableView.reloadData()
            print(newValue)
            let films = FilmTableViewCell()
            
            
        }
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configCells()
        reformMovies()
    }

    // MARK: - Private methods
    
    private func configUI() {
        title = "Фильмы"
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = UIColor(named: "blueView")
        navigationController?.navigationBar.tintColor = UIColor.red
        view.backgroundColor = UIColor(named: "blueView")
    }
    
    
    
    private func configCells() {
        tableView.register(FilmTableViewCell.self, forCellReuseIdentifier: "film")
        tableView.register(FilterTableViewCell.self, forCellReuseIdentifier: "filter")
        tableView.showsVerticalScrollIndicator = false 
    }
    
    public func reformMovies() {
        let session = URLSession.shared
        
        guard let url = URL(string: actualURL) else { return }
        session.dataTask(with: URLRequest(url: url)) {(data, response, error) in
            
            do {
                guard let newData = data else { return }
                let result = try JSONDecoder().decode(MovieResult.self, from: newData)
                DispatchQueue.main.async {
                    self.movies = result.results
                    self.tableView.reloadData()
                    print("Movies: \(self.movies)")
                }
            } catch {
                print("Error: \(error)")
            }
        }.resume()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension FilmsTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
       return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return movies.count
        }
        return section
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "filter", for: indexPath) as? FilterTableViewCell else { return UITableViewCell() }

            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "film", for: indexPath) as? FilmTableViewCell else { return UITableViewCell() }
            cell.refresh(data: movies[indexPath.row])
            
            return cell
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


