//
//  ViewController.swift
//  Fav-Games
//
//  Created by Evgeny Vlasov on 9/5/16.
//  Copyright © 2016 Evgeny Vlasov. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var videoGames = [VideoGame]()
//    var fetchedResultsController: NSFetchedResultsController!    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        fetchAndSetResults()
        tableView.reloadData()
    }
    
    func fetchAndSetResults(){
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "VideoGame")
        
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            self.videoGames = results as! [VideoGame]
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        if let cell = tableView.dequeueReusableCellWithIdentifier("GameCell") as? GameCell {
            
            let game = videoGames[indexPath.row]
            cell.configureCell(game)
            return cell
        } else {
            return GameCell()
        }
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoGames.count
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let videoGame = videoGames[indexPath.row]
        performSegueWithIdentifier("DetailedGameVC", sender: videoGame)
        
        print("Did select row at index path")
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DetailedGameVC" {
            if let detailedVC = segue.destinationViewController as? DetailedGameVC {
                if let videoGame = sender as? VideoGame {
                    detailedVC.videoGame = videoGame
                    
                    print("Prepared for segue")

                }
            }
        }
    }
    
}

