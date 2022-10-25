// FilmsTableViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class FilmsTableViewController: UITableViewController {
    
    let decoder = JSONDecoder()
    
    var movies = [Result]()
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
    
    private func reformMovies() {
        let session = URLSession.shared
        
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=56c45ba32cd76399770966658bf65ca0&language=ru-RU&page=1") else { return }
        session.dataTask(with: URLRequest(url: url)) {(data, response, error) in
            
            do {
                let result = try JSONDecoder().decode(MovieResult.self, from: data!)
                DispatchQueue.main.async {
                    self.movies = result.results
                    print(self.movies)
                }
            } catch {
                
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
            return 20
        }
        return section
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "filter", for: indexPath)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "film", for: indexPath)
            return cell
        default:
            return UITableViewCell()
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


