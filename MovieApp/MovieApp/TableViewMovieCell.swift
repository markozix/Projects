//
//  TableViewMovieCell.swift
//  MovieApp
//
//  Created by Marko Vukicevic on 9/30/19.
//  Copyright © 2019 Markan. All rights reserved.
//

import UIKit

class TableViewMovieCell: UITableViewCell {
    
    @IBOutlet weak var imageHolder: UIImageView!
    @IBOutlet weak var moveName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    

}
