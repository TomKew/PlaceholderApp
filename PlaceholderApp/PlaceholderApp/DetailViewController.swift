//
//  DetailViewController.swift
//  PlaceholderApp
//
//  Created by Field Employee on 4/8/20.
//  Copyright © 2020 Tom Kew-Goodale. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    var getimage =  UIImage()
    
   @IBOutlet weak var imageField: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageField.image = getimage
        
    }
    
    
    
    }

