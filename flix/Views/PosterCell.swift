//
//  PosterCell.swift
//  flix
//
//  Created by Raquel Figueroa-Opperman on 2/7/18.
//  Copyright © 2018 Raquel Figueroa-Opperman. All rights reserved.
//

import UIKit

class PosterCell: UICollectionViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    var movie: Movie! {
        didSet {
            posterImageView.af_setImage(withURL: movie.posterUrl!)
        }
    }
}
