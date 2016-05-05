//
//  post.swift
//  Fav-Notes
//
//  Created by Mc on 5/4/16.
//  Copyright © 2016 Good Rock Apps LLC. All rights reserved.
//

import Foundation

class Post: NSObject , NSCoding {
    
    private var _imagePath: String!
    private var _title: String!
    private var _postDescription: String!
    
    init(imagePath:String, title:String, desc:String){
        
        self._imagePath = imagePath
        self._title = title
        self._postDescription = desc
        
    }
    
    
    var imagePath: String {
        return _imagePath
    }
    
    var title: String {
        return _title
    }
    
    var postDesc: String {
     return _postDescription
    }
    
    override init() {
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self._imagePath = aDecoder.decodeObjectForKey("imagePath") as? String
        self._title = aDecoder.decodeObjectForKey("title") as? String
        self._postDescription = aDecoder.decodeObjectForKey("postDescription")! as? String

    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self._imagePath, forKey: "imagePath")
        
        aCoder.encodeObject(self._title, forKey: "title")
        
        aCoder.encodeObject(self._postDescription, forKey: "postDescription")
    }
    
   }