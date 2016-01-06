//
//  ViewController.swift
//  MusicInformation
//
//  Created by Andrea Baldelomar on 1/4/16.
//  Copyright © 2016 Andrea Baldelomar. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, AVAudioPlayerDelegate {
    
    //View Controllers
    @IBOutlet weak var texFieldMusic: UITextField!
    @IBOutlet weak var labelMusic: UILabel!
    @IBOutlet weak var imageTortoise: UIImageView!
    
    var track = Track?()
    var audioPlayer = AVAudioPlayer()
    var urlSong = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        texFieldMusic.delegate = self
        // Set up views if editing an existing Meal.
        if let track = track {
            navigationItem.title = track.artistName
            texFieldMusic.text   = track.artistName
            imageTortoise.image = track.image
            labelMusic.text = track.song
            urlSong = track.urlSong
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Actions
    @IBAction func buttonSearch(sender: UIButton) {
        labelMusic.text = "Music Name"
        do{
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
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //hide keyboard
        texFieldMusic.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        labelMusic.text = texFieldMusic.text
    }
    
    
    @IBAction func selectFromGallery(sender: UITapGestureRecognizer) {
        texFieldMusic.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .PhotoLibrary
        imagePickerController.delegate = self
        
        presentViewController(imagePickerController,animated:true, completion:nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        print("algoooooooooo")
        dismissViewControllerAnimated(true, completion:nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageTortoise.image = selectedImage
        //dissmiis controller image
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}

