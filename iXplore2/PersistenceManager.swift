//
//  PersistenceManager.swift
//  iXplore2
//
//  Created by Lauren Caverly on 6/14/16.
//  Copyright © 2016 Lauren Caverly. All rights reserved.
//

import Foundation
import UIKit

class PersistenceManager {
    
    //Gets you the writing document directory path
    class private func documentsDirectory() -> NSString {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentDirectory = paths[0] as String
        return documentDirectory
    }
    
    class func loadObject(filename:String) -> NSObject? {
        let file = documentsDirectory().stringByAppendingPathComponent(filename)
        let result = NSKeyedUnarchiver.unarchiveObjectWithFile(file)
        return result as? NSObject
    }
    
    class func saveObject(objectToSave: NSObject, fileName: String) {
        let file = documentsDirectory().stringByAppendingPathComponent(fileName)
        NSKeyedArchiver.archiveRootObject(objectToSave, toFile: file)
    }
    
    class func saveNSArray(arrayToSave: NSArray, fileName:String) {
        let file = documentsDirectory().stringByAppendingPathComponent(fileName)
        NSKeyedArchiver.archiveRootObject(arrayToSave, toFile: file)
    }
    
    class func loadNSArray(fileName:String) -> NSArray? {
        let file = documentsDirectory().stringByAppendingPathComponent(fileName)
        let result = NSKeyedUnarchiver.unarchiveObjectWithFile(file)
        return result as? NSArray
    }
    
}