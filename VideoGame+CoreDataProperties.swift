//
//  VideoGame+CoreDataProperties.swift
//  Fav-Games
//
//  Created by Evgeny Vlasov on 9/6/16.
//  Copyright © 2016 Evgeny Vlasov. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension VideoGame {

    @NSManaged var image: NSData?
    @NSManaged var title: String?
    @NSManaged var desc: String?
    @NSManaged var mgLink: String?
    @NSManaged var note: String?
    @NSManaged var offLink: String?

}
