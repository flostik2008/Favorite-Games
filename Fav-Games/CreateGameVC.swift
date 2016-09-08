//
//  CreateGameVC.swift
//  Fav-Games
//
//  Created by Evgeny Vlasov on 9/6/16.
//  Copyright © 2016 Evgeny Vlasov. All rights reserved.
//

import UIKit
import CoreData

class CreateGameVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var gameTitle: UITextField!
    
    @IBOutlet weak var descView: UITextView!

    @IBOutlet weak var mgLink: UITextField!
    @IBOutlet weak var offLink: UITextField!
 
    @IBOutlet weak var noteView: UITextView!
    
    @IBOutlet weak var addImgBtn: UIButton!
    @IBOutlet weak var addGameBtn: UIButton! 
    
    var imagePicker: UIImagePickerController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        addGameBtn.layer.cornerRadius = 5.0
        
        let customFont = UIFont(name: "Eight-Bit Madness", size: 30.0)        
//        UINavigationBar.appearance().titleTextAttributes = [ NSFontAttributeName: customFont!]
        UIBarButtonItem.appearance().setTitleTextAttributes([NSFontAttributeName: customFont!, ], forState: UIControlState.Normal)
        
        
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        gameImage.image = image
        addImgBtn.hidden = true
        gameImage.alpha = 1
        
    }

    @IBAction func addImage(sender: AnyObject!) {
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func addGame(sender: AnyObject!) {
        if let title = gameTitle.text where title != "" {
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("VideoGame", inManagedObjectContext: context)!
            let videoGame = VideoGame(entity: entity, insertIntoManagedObjectContext: context)
            
            videoGame.title = gameTitle.text
            videoGame.desc = descView.text
            videoGame.mgLink = mgLink.text
            videoGame.note = noteView.text
            videoGame.offLink = offLink.text
            videoGame.setGameImage(gameImage.image!)
            
            context.insertObject(videoGame)
        
            do {
                try  context.save()
            } catch {
                print("Couldn't save videoGame")
            }
            
            self.navigationController?.popToRootViewControllerAnimated(true)
            
        }
    }
  
}












