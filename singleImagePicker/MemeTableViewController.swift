//
//  MemeTableViewController.swift
//  memeMe2.0
//
//  Created by Stu Almeleh on 12/8/15.
//  Copyright © 2015 Stu Almeleh. All rights reserved.
//

import Foundation
import UIKit

class MemeTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var memes: [Meme] {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        
        tableView.reloadData()
        print("tableView reloaded")
        
        print("# of memes in AppDelegate: "+String((UIApplication.sharedApplication().delegate as! AppDelegate).memes.count))
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //determine which cell
        let cell = tableView.dequeueReusableCellWithIdentifier("MemeTableViewCell", forIndexPath: indexPath) as! MemeTableViewCell
        //determine the correct meme
        let selectedMeme = memes[indexPath.row]
        
        //set the name and image
        cell.setText(selectedMeme.topText, bottom: selectedMeme.bottomText)
        cell.imageView2?.image = selectedMeme.memedImage
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //Grab the DetailVC from Storyboard
        let detailVC = self.storyboard!.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        
        //Populate view controller with data from the selected item
        detailVC.meme = memes[indexPath.row]
        
        //Present the view controller using navigation
        self.navigationController!.pushViewController(detailVC, animated: true)
    }
    
    
}