//
//  VideoGame.swift
//  Fav-Games
//
//  Created by Evgeny Vlasov on 9/6/16.
//  Copyright © 2016 Evgeny Vlasov. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class VideoGame: NSManagedObject {

// Insert code here to add functionality to your managed object subclass

    func setGameImage(img: UIImage) {
        let data = UIImagePNGRepresentation(img)
        self.image = data
    }
    
    func getGameImage() -> UIImage {
        let img = UIImage(data: self.image!)!
        return img
    }
    
}
