//
//  Model.swift
//  youtubexcodeapp
//
//  Created by Dave Whettingsteel on 2/6/20.
//  Copyright © 2020 Dave Whettingsteel. All rights reserved.
//

import Foundation

protocol ModelDelegate {
    func videosFetched( videos:[Video])

}

class Model {
    
    var delegate:ModelDelegate?
    
    func getVideos() {
    
    // Create a URL Object
    
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
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
        
        
        // Parsing data into video objects
        do {
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        let response = try decoder.decode(Response.self, from: data!)
            
            if response.items != nil {
            
            // Call the "VideosFetched" method of the delegate
                
                DispatchQueue.main.sync {
                
                    self.delegate?.videosFetched(videos: response.items!)
                }
                    
            }
            
            // dump(response)
        }
        catch {
        
        }
        
    }
    // Fire up the task
        dataTask.resume()
        
}
    
}
