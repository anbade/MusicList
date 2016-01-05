//
//  MusicListTableViewCell.swift
//  MusicInformation
//
//  Created by Andrea Baldelomar on 1/5/16.
//  Copyright © 2016 Andrea Baldelomar. All rights reserved.
//

import UIKit

class MusicListTableViewCell: UITableViewCell {
    
    //Elements from view
    @IBOutlet weak var labelMusicTitle: UILabel!
    @IBOutlet weak var imageMusic: UIImageView!
    @IBOutlet weak var labelMusicArtist: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
