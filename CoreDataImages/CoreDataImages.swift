//
//  CoreDataImages.swift
//  CoreDataImages
//
//  Created by Dayton on 3/22/19.
//  Copyright © 2019 Dayton Steffeny. All rights reserved.
//

import Foundation
import CoreData
import UIKit

@objc(Image)
public class Image: NSManagedObject {
   
    var dateModified: Date? {
        get {
            return rawDateModified as Date?
        }
        set {
            rawDateModified = newValue as NSDate?
        }
    }
    
    var size: Int? {
        get {
            return rawImage?.length
        }
    }
    
    var image: UIImage? {
        get {
            if let data = rawImage as Data? {
                return UIImage(data: data)
            }
            
            return nil
        }
       
        set(newImage) {
            if let newImage = newImage {
                if let data = newImage.pngData() as NSData? {
                    print(data.length)
                    rawImage = data
                }
            }
            else {
                rawImage = nil
            }
        }
    }
    
    convenience init?(title: String?, image: UIImage?) {
       
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        self.init(entity: Image.entity(), insertInto: managedContext)
        
        self.title = title
        self.image = image
        self.dateModified = Date()
    }
}
