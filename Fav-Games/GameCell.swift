//
//  GameCell.swift
//  Fav-Games
//
//  Created by Evgeny Vlasov on 9/6/16.
//  Copyright © 2016 Evgeny Vlasov. All rights reserved.
//

import UIKit

class GameCell: UITableViewCell {
    
    
    @IBOutlet weak var gameImg: UIImageView!
    @IBOutlet weak var gameTitle: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(videoGame: VideoGame) {
        gameImg.image = videoGame.getGameImage()
        gameTitle.text = videoGame.title
    
    }
}
