//
//  Track.swift
//  MusicInformation
//
//  Created by Andrea Baldelomar on 1/4/16.
//  Copyright © 2016 Andrea Baldelomar. All rights reserved.
//

import UIKit

class Track{
    var artistName: String
    var song: String
    var image: UIImage?
    
    init(artistName:String, song:String, image:UIImage){
        self.artistName = artistName
        self.song = song
        self.image = image
    }
}
