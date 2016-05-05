//
//  datasevice.swift
//  Fav-Notes
//
//  Created by Mc on 5/4/16.
//  Copyright © 2016 Good Rock Apps LLC. All rights reserved.
//

import Foundation
import UIKit

class dataservice{
    static let instance = dataservice()
    
    let  KEY_POST = "posts"
    
    
    private var _loaddedPost = [Post]()
    
    var loadedPost: [Post] {
        return _loaddedPost
    }
    
    func savePosts() {
        

        let  postData = NSKeyedArchiver.archivedDataWithRootObject(_loaddedPost)
        NSUserDefaults.standardUserDefaults().setObject(postData, forKey: KEY_POST)
        NSUserDefaults.standardUserDefaults().synchronize()

        
    }
    func loadPost() {
       if let postData = NSUserDefaults.standardUserDefaults().objectForKey(KEY_POST) as? NSData {
        if let postArray = NSKeyedUnarchiver.unarchiveObjectWithData(postData) as? [Post] {
            
            _loaddedPost = postArray
            
        }
        }
        
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "postsLoaded", object: nil))
        
    }
    
    func  saveIMageAndCreatePath(image: UIImage)-> String {
        let imageData = UIImagePNGRepresentation(image)
        let imgpath = "image\(NSDate.timeIntervalSinceReferenceDate()).png"
        let fulPath = documentsPathForFileNAme(imgpath)
        imageData?.writeToFile(fulPath, atomically: true)
        
        return imgpath
    }
    func imageForPath(path:String) -> UIImage? {
        let fullPath = documentsPathForFileNAme(path)
        let image = UIImage(named: fullPath)
        
        return image
    }
    func  addPost(post: Post) {
        _loaddedPost.append(post)
        savePosts()
        loadPost()
        
    }
    
    
    
    
    func documentsPathForFileNAme(name:String) -> String {
        let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let fullPath = path[0] as NSString
        return fullPath.stringByAppendingPathComponent(name)
        
        
    }
    
}
