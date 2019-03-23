//
// CoreDataImagesProperties.swift
//  CoreDataImages
//
//  Created by Dayton on 3/22/19.
//  Copyright © 2019 Dayton Steffeny. All rights reserved.
//

import Foundation
import CoreData


extension Image {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Image> {
    
        return NSFetchRequest<Image>(entityName: "Image")
    
    }

    @NSManaged public var title: String?
    @NSManaged public var rawDateModified: NSDate?
    @NSManaged public var rawImage: NSData?

}
