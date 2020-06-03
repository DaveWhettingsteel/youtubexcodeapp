//
//  Model.swift
//  youtubexcodeapp
//
//  Created by Dave Whettingsteel on 2/6/20.
//  Copyright © 2020 Dave Whettingsteel. All rights reserved.
//

import Foundation

class Model {
    
    func getVideos() {
    
    // Create a URL Object
    
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else{
            return
        }
        
    // get a URLSession object
    
        let session = URLSession.shared
        
    // Get a data task from the URLSession object
    
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
        
        // Check for errors
        if error != nil || data == nil {
            return
        }
        
        }
        
    // Fire up the task
        dataTask.resume()
        
}
    
}
