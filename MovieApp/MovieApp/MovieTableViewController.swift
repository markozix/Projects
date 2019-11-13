//
//  MovieTableViewController.swift
//  MovieApp
//
//  Created by Marko Vukicevic on 9/30/19.
//  Copyright © 2019 Markan. All rights reserved.
//

import UIKit

class MovieTableViewController: UIViewController {
    
    
    @IBOutlet var tableView: UITableView!
    
    var movie : MovieModel?
    var movieList = [MovieModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        debugPrint("Here is \(movieList[0].name)")
        tableView.delegate = self
        tableView.dataSource = self
    }
}


extension MovieTableViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            print(movieList.count)
            return movieList.count
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewMovieCell

            cell.moveName.text = movieList[indexPath.row].name
            cell.imageView!.image = movieList[indexPath.row].image
        
            return cell
        }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    }


