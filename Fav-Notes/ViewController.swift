//
//  ViewController.swift
//  Fav-Notes
//
//  Created by Mc on 5/4/16.
//  Copyright © 2016 Good Rock Apps LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
   // var posts = [Post]()
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)

    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
//        
//        var post = Post(imagePath: "", title: "Post 1", desc: "Post one Description")
//        var post2 = Post(imagePath: "", title: "Post 2", desc: "Post two Description")
//        var post3 = Post(imagePath: "", title: "Post 3", desc: "Post three Description")
//
//        posts.append(post)
//        posts.append(post2)
//        posts.append(post3)
        
        
        dataservice.instance.loadPost()
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onPostsLoaded:" , name: "postsLoaded", object: nil)
        
        
        tableView.reloadData()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        
        return dataservice.instance.loadedPost.count
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        let post = dataservice.instance.loadedPost[indexPath.row]
        
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("postCell") as? customCell {
            cell.configureCell(post)
            
            return cell
        } else {
            let cell = customCell()
            cell.configureCell(post)
            
            return cell
        }

        
        
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
      return  93.0
    }
    
    func onPostsLoaded (notif: AnyObject) {
        tableView.reloadData()
    }
    
    
    
}

