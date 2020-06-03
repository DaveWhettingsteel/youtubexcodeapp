//
//  File.swift
//  youtubexcodeapp
//
//  Created by Dave Whettingsteel on 2/6/20.
//  Copyright © 2020 Dave Whettingsteel. All rights reserved.
//

import Foundation

struct Constants {
    
    static var API_KEY = "AIzaSyAOsNVCTe31tnWlxZ7xc-26XKHbX3egULU"
    static var PLAYLIST_ID = "PLMRqhzcHGw1aLoz4pM_Mg2TewmJcMg9ua"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
}
