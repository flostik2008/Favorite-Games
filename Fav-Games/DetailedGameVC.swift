//
//  DetailedGameVC.swift
//  Fav-Games
//
//  Created by Evgeny Vlasov on 9/7/16.
//  Copyright © 2016 Evgeny Vlasov. All rights reserved.
//

import UIKit
import WebKit

class DetailedGameVC: UIViewController {

    var videoGame1: VideoGame!
    
    
    @IBOutlet weak var gameImg: UIImageView!
    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var gameDesc: UILabel!
    @IBOutlet weak var gameNote: UILabel!
    @IBOutlet weak var webBtn: UIButton!
    @IBOutlet weak var mgBtn: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webBtn.layer.cornerRadius = 5.0
        mgBtn.layer.cornerRadius = 5.0
        
        gameImg.image = videoGame1.getGameImage()
        gameTitle.text = videoGame1.title
        gameDesc.text = videoGame1.desc
        gameNote.text = videoGame1.note
        
        gameDesc.sizeToFit()
        gameNote.sizeToFit()
    
    scrollView.frame=CGRectMake(0,0,320,self.view.frame.size.height-44)
    
    }
    
    @IBAction func offWebBtn(sender: AnyObject) {
        
  
//        performSegueWithIdentifier("WebViewVC", sender: videoGame1)
        
    }

    @IBAction func mgBtn(sender: AnyObject) {
    
//            performSegueWithIdentifier("mgLink", sender: videoGame1)
        }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "WebViewVC" {
            if let webViewVC = segue.destinationViewController as? WebViewVC {
                
                webViewVC.videoGame = videoGame1
                webViewVC.whichLink = "official link"
                
            }
        }
        
                else if segue.identifier == "mgLink" {
                    if let webViewVC = segue.destinationViewController as? WebViewVC {
                        
                            webViewVC.videoGame = videoGame1
                            webViewVC.whichLink = "moby game link"
                        
                    }
                }
        
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "WebViewVC" {
//            if let webViewVC = segue.destinationViewController as? WebViewVC {
//                if let videoGame2 = sender as? VideoGame {
//                    webViewVC.videoGame.offLink = videoGame2.offLink
//                    
//                    print("Did this shit happend or not? : \(webViewVC.videoGame.offLink)")
//                }
//            }
//        }

        
    }
    
    
 
}
















