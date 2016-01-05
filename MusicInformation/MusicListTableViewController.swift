//
//  MusicListTableViewController.swift
//  MusicInformation
//
//  Created by Andrea Baldelomar on 1/5/16.
//  Copyright © 2016 Andrea Baldelomar. All rights reserved.
//

import UIKit

class MusicListTableViewController: UITableViewController {
    
    //Variables
    var tracks = [Track]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleTracks()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    func loadSampleTracks(){
        let photo1 = UIImage(named: "Bird")!
        let track1 = Track(artistName: "Bird",song:"birds song", image: photo1)
        let photo2 = UIImage(named: "Tortoise")!
        let track2 = Track(artistName: "Tortoise",song:"tortoise song", image: photo2)
        let photo3 = UIImage(named: "Tree")!
        let track3 = Track(artistName: "Tree",song:"tree song", image: photo3)
        tracks += [track1, track2, track3]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
