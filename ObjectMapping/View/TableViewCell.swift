//
//  TableViewCell.swift
//  ObjectMapping
//
//  Created by vamshi on 24/11/18.
//  Copyright © 2018 vamshi. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var kindLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var artistImage: UIImageView!
    
    func configureCell(with result:results){
        artistNameLabel.text = result.artistName
        kindLabel.text = result.kind
        
        guard let url = result.artworkUrl100 else{return}
        artistImage.sd_setImage(with: URL(string: url))

    }

}
