//
//  MusicListTableViewController.swift
//  MusicInformation
//
//  Created by Andrea Baldelomar on 1/5/16.
//  Copyright © 2016 Andrea Baldelomar. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MusicListTableViewController: UITableViewController {
    
    //Variables
    var tracks = [Track]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadFromRest()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func load_image(urlString:String, artistName:String, songName:String, urlSong:String)
    {
        let url = NSURL(string: urlString)
        let request: NSURLRequest = NSURLRequest(URL: url!)
        let mainQueue = NSOperationQueue.mainQueue()
        NSURLConnection.sendAsynchronousRequest(request, queue: mainQueue, completionHandler: { (response, data, error) -> Void in
            if error == nil {
                // Convert the downloaded data in to a UIImage object
                let image = UIImage(data: data!)
                let track1 = Track(artistName: artistName, song:songName, image:image!, urlSong:urlSong)
                self.tracks += [track1]
                
                dispatch_async(dispatch_get_main_queue(), {
                    self.tableView.reloadData()
                    return
                })
                self.tableView.reloadData()
            }
            else {
                let photo1 = UIImage(named: "Bird")!
                let track1 = Track(artistName: artistName, song:songName, image:photo1,urlSong:urlSong)
                self.tracks += [track1]
                print("Error: \(error!.localizedDescription)")
            }
        })
        
    }
    
    func loadFromRest(){
        Alamofire.request(.GET, "https://itunes.apple.com/us/rss/topsongs/limit=25/genre=14/explicit=true/json")
            .responseJSON{response in
                if(response.result.isSuccess){
                    let json = JSON(data: response.data!)
                    let musicListCount = json["feed"]["entry"].count
                    let musicListArray = json["feed"]["entry"]
                    for i in 0..<musicListCount {
                        let artistName = musicListArray[i]["im:artist"]["label"].string!
                        let songName = musicListArray[i]["im:name"]["label"].string!
                        let urlString = musicListArray[i]["im:image"][2]["label"].string!
                        let urlSong = musicListArray[i]["link"][1]["attributes"]["href"].string!
                        self.load_image(urlString, artistName: artistName, songName: songName, urlSong:urlSong)
                    }
                }
        }
    }
    
    


    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "MusicListTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MusicListTableViewCell
        
        // Fetches the appropriate meal for the data source layout.
        let track = tracks[indexPath.row]
        
        cell.labelMusicTitle.text = track.artistName
        cell.imageMusic.image = track.image
        cell.labelMusicArtist.text = track.song
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier == "ShowDetail"){
            let musicDetailViewController = segue.destinationViewController as! ViewController
            // Get the cell that generated this segue.
            if let selectedMusicCell = sender as? MusicListTableViewCell {
                let indexPath = tableView.indexPathForCell(selectedMusicCell)!
                let selectedMusic = tracks[indexPath.row]
                musicDetailViewController.track = selectedMusic
            }
        }
    }
    

}
