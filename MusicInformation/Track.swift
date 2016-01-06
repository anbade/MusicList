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
    var urlSong: String
    
    init(artistName:String, song:String, image:UIImage, urlSong:String){
        self.artistName = artistName
        self.song = song
        self.image = image
        self.urlSong = urlSong
    }
}
