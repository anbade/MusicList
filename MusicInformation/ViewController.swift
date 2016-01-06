//
//  ViewController.swift
//  MusicInformation
//
//  Created by Andrea Baldelomar on 1/4/16.
//  Copyright © 2016 Andrea Baldelomar. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, AVAudioPlayerDelegate {
    
    //View Controllers
    @IBOutlet weak var labelMusic: UILabel!
    @IBOutlet weak var imageTortoise: UIImageView!
    
    var track = Track?()
    var audioPlayer = AVAudioPlayer()
    var urlSong = String()
    var image = UIImage()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Set up views if editing an existing Meal.
        if let track = track {
            navigationItem.title = track.artistName
           imageTortoise.image = track.image
            labelMusic.text = track.song
            urlSong = track.urlSong
            image = track.image!
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Actions
    @IBAction func buttonSearch(sender: UIButton) {
        /*do{
            let url = urlSong
            let fileURL = NSURL(string:url)
            let soundData = NSData(contentsOfURL:fileURL!)
            self.audioPlayer = try AVAudioPlayer(data: soundData!)
            audioPlayer.prepareToPlay()
            audioPlayer.volume = 1.0
            audioPlayer.delegate = self
            audioPlayer.play()
        }catch {
            print("Error getting the audio file")
        }*/
    }
    
    
    @IBAction func selectFromGallery(sender: UITapGestureRecognizer) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .PhotoLibrary
        imagePickerController.delegate = self
        
        presentViewController(imagePickerController,animated:true, completion:nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue,
        sender: AnyObject?) {
            let destination = segue.destinationViewController as!
            AVPlayerViewController
            let url = NSURL(string: urlSong)!
            destination.player = AVPlayer(URL: url)
    }
    
}

