//
//  MemeTableViewController.swift
//  ImagePickerTestforMeMe
//
//  Created by Stephanie Truchan on 5/23/15.
//  Copyright (c) 2015 Stephanie Truchan. All rights reserved.
//

import UIKit

class MemeTableViewController: UITableViewController, UITableViewDataSource {

    
    // Set up variable to store Shared Data
    var memes: [Meme]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let object = UIApplication.sharedApplication().delegate
        let appDelegate = object as! AppDelegate
        memes = appDelegate.memes
        
        // reload data to force image load into table and delegate calls
        self.tableView.reloadData()
        
        }
    
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return memes.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("memeCell") as! UITableViewCell
        
        // Configure the cell...
        let memeItem = memes[indexPath.row]
        
        // Set the image
        cell.imageView?.image = memeItem.memedImage as UIImage
        
        // Add Top Text as Label or Bottom text if there is no top text
        if memeItem.topText != "" {
            cell.textLabel?.text = memeItem.topText
        } else {
            cell.textLabel?.text = memeItem.bottomText
        }
        
        return cell
    }
    
    // Open up the detail view when the user selects a row
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let detailController = self.storyboard!.instantiateViewControllerWithIdentifier("MemeDetailViewController")! as! MemeDetailViewController
        detailController.meme = self.memes[indexPath.row]
        self.navigationController!.pushViewController(detailController, animated: true)
        
    }
    
    
    // Create another Meme - Segue to Edit View Controller using CODE ONLY
    @IBAction func AddNewMeme(sender: UIBarButtonItem) {
        let storyboard = self.storyboard
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("EditViewController") as! EditViewController
        
        self.presentViewController(controller, animated: true, completion: nil)
    
    }

}









