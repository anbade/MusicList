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
    var price: String
    var rights: String
    var releaseDate: String
    
    init(artistName:String, song:String, image:UIImage, urlSong:String, price:String, rights:String, releaseDate:String){
        self.artistName = artistName
        self.song = song
        self.image = image
        self.urlSong = urlSong
        self.price = price
        self.rights = rights
        self.releaseDate = releaseDate
    }
}
