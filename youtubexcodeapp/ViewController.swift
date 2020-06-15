//
//  ViewController.swift
//  youtubexcodeapp
//
//  Created by Dave Whettingsteel on 2/6/20.
//  Copyright © 2020 Dave Whettingsteel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
          
       
    
    var model = Model()
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Se itself as the datasource and delegate
        
        tableView.dataSource = self
        tableView.delegate = self
        model.delegate = self
        
        model.getVideos()
    }
    
        // MARK: MOdel Delegate Method
        
        func videosFetched( videos: [Video]) {
       
            // Set the returned videos to our video property
            
            self.videos = videos
            
            // Refresh the TableView
    
            tableView.reloadData()
            
        }
    
    // MARK: - TableView Methods

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDOECELL_ID, for: indexPath )
        
        // Configure cell with the data
        
        let title = self.videos[indexPath.row].title
        cell.textLabel?.text = title
        
        // Return the Cell
        return cell
    
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    
    }
}

