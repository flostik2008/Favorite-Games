//
//  DetailedGameVC.swift
//  Fav-Games
//
//  Created by Evgeny Vlasov on 9/7/16.
//  Copyright © 2016 Evgeny Vlasov. All rights reserved.
//

import UIKit

class DetailedGameVC: UIViewController {

    var videoGame: VideoGame!
    
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
        
        gameImg.image = videoGame.getGameImage()
        gameTitle.text = videoGame.title
        gameDesc.text = videoGame.desc
        gameNote.text = videoGame.note
        
        gameDesc.sizeToFit()
        gameNote.sizeToFit()
        
        scrollView.frame=CGRectMake(0,0,320,self.view.frame.size.height-44)
    
    }


    @IBAction func offWebBtn(sender: AnyObject) {
    }

    @IBAction func mgBtn(sender: AnyObject) {
        
    }
}
