//
//  ViewController.swift
//  MovieApp
//
//  Created by Marko Vukicevic on 9/30/19.
//  Copyright © 2019 Markan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var niz = [MovieModel]()
    var film = MovieModel()
    @IBOutlet weak var btn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    

    @IBAction func btnGetAction(_ sender: Any) {
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/550?api_key=fb00acc4c01bec9f5a64dc88f097a051")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("error: \(error)")
            } else {
                if let response = response as? HTTPURLResponse {
                    print("statusCode: \(response.statusCode)")
                }
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                   //print("data: \(dataString)")
                    
                    var json = try? JSONSerialization.jsonObject(with: data, options: [])
                    //print(json)
                    
                    if let dictionary = json as? [String: Any] {
                        if let title = dictionary["original_title"] as? String {
                            debugPrint(title)
                            DispatchQueue.main.async {
                                self.film.name = title
                                self.niz.append(self.film)
                                debugPrint(self.niz.count)
                                let vc = self.storyboard?.instantiateViewController(withIdentifier: "MovieTableViewController") as! MovieTableViewController
                                vc.movieList = self.niz
                                self.navigationController?.pushViewController(vc, animated: true)
                            }
                            
                            
                            if var imagePath = dictionary["poster_path"] as? String{

                                //https://image.tmdb.org/t/p/w100/adw6Lq9FiC9zjYEpOqfq03ituwp.jpg

                                let imageUrlString = "https://image.tmdb.org/t/p/w200" + imagePath

                                let imageUrl = URL(string: imageUrlString)!

                                let imageData = try! Data(contentsOf: imageUrl)

                                let image = UIImage(data: imageData)

                                self.film.image = image!
                                self.niz.append(self.film)

                            }
                            
                            
                        }
                    }
            }
        }
  
    }
        task.resume()
}

    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if (segue.identifier == "prebaci") {
//            let vc = segue.destination as! MovieTableViewController
//            print(self.niz.count)
//            vc.movieList = self.niz
//        }
//    }
}
