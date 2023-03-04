//
//  PlayerCoreData+CoreDataProperties.swift
//  CricketWatch
//
//  Created by BJIT on 20/2/23.
//
//

import Foundation
import CoreData


extension PlayerCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PlayerCoreData> {
        return NSFetchRequest<PlayerCoreData>(entityName: "PlayerCoreData")
    }

    @NSManaged public var id: Int64
    @NSManaged public var fullname: String?
    @NSManaged public var imagePath: String?
    @NSManaged public var countryImage: String?

}

extension PlayerCoreData : Identifiable {

}
