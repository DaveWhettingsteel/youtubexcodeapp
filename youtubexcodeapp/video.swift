//
//  video.swift
//  youtubexcodeapp
//
//  Created by Dave Whettingsteel on 2/6/20.
//  Copyright © 2020 Dave Whettingsteel. All rights reserved.
//

import Foundation

struct Video : Decodable {
    var videoid = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    enum CodingKeys: String, CodingKey {
        
        case snippet
        case thumbnails
        case high
        case resourceID
        
        case published = "publishedAt"
        case title
        case description
        case thumbnail = "url"
        case videoId
        
    }
    
    init (from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        // Parse title
        
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        
        // parse description
        
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        
        
        // parse publish date
                
         self.published = try snippetContainer.decode(Date.self, forKey: .published)
        
        // Parse thumnails
        
        let thumbnailcontainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        
        let highcontainer = try thumbnailcontainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        self.thumbnail = try highcontainer.decode(String.self, forKey: .thumbnail)
        
        // Parse Video ID
        
        let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceID)
        
        self.videoid = try resourceIdContainer.decode(String.self, forKey: .videoId)
        
        
        
        
        
    }
    
}
