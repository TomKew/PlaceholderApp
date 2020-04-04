//
//  ViewController.swift
//  PlaceholderApp
//
//  Created by Field Employee on 4/3/20.
//  Copyright © 2020 Tom Kew-Goodale. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        fillChar()
        
    }

    func fillChar(){
           let urlHolder: URL = URL(string: "https://jsonplaceholder.typicode.com/photos")!
                 
           let data = try! Data(contentsOf: urlHolder)
        
        
                    
            let json: JSON = JSON(data)
        
           print(json)
        
           for (_, value) in json{
            let ColorWall = PlaceholderLIB()

               ColorWall.title = value["title"].stringValue
               ColorWall.Image = value["url"]["URL"].stringValue
               
 
           }
        
       }
    

}

