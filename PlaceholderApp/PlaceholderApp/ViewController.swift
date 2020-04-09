//
//  ViewController.swift
//  PlaceholderApp
//
//  Created by Field Employee on 4/3/20.
//  Copyright © 2020 Tom Kew-Goodale. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var charDic: [PlaceholderLIB] = [PlaceholderLIB]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
       fillChar()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return charDic.count
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectCell", for: indexPath) as! CollectionViewCell
         
        let url = URL(string: charDic[indexPath.row].MainImage)
     
               guard let urlfordata = url else {
                   print("fail to load image")
                   return cell}
               if let data = try? Data(contentsOf: urlfordata){
                cell.ColorImage.image = UIImage(data: data)
                   }
         return cell
    }
    



    func fillChar(){
      let urlHolder: URL = URL(string: "https://jsonplaceholder.typicode.com/photos")!
             
    let data = try! Data(contentsOf: urlHolder)
    let json: JSON = JSON(data)
    for (_, value) in json{
       let ColorWall = PlaceholderLIB()

          ColorWall.MainImage = value["url"].stringValue
        
        charDic.append(ColorWall)
      }
    

}

}
