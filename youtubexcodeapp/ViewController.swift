//
//  ViewController.swift
//  youtubexcodeapp
//
//  Created by Dave Whettingsteel on 2/6/20.
//  Copyright © 2020 Dave Whettingsteel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var model = Model()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        model.getVideos()
       
    }


}

