//
//  customCell.swift
//  Fav-Notes
//
//  Created by Mc on 5/4/16.
//  Copyright © 2016 Good Rock Apps LLC. All rights reserved.
//

import UIKit

class customCell: UITableViewCell {
    
    @IBOutlet weak var postImage: UIImageView!
    
    @IBOutlet weak var postTitle: UILabel!
    
    @IBOutlet weak var postDesc: UILabel!
    
    
    
    override func awakeFromNib() {
        
        postImage.layer.cornerRadius = 10.0
        
        postImage.clipsToBounds = true
        
        
        
    }
    
    
    func configureCell (post:Post){
        
        postTitle.text = post.title
        postDesc.text = post.postDesc
        postImage.image = dataservice.instance.imageForPath(post.imagePath)
        
        
        
        
    }

  
}
