//
//  TableViewController.swift
//  PlaceholderApp
//
//  Created by Field Employee on 4/3/20.
//  Copyright © 2020 Tom Kew-Goodale. All rights reserved.
//

import UIKit
import SwiftyJSON

class TableViewController: UITableViewController {

    var detailViewController: ViewController? = nil
    var objects = [Any]()
    
    var charDic: [PlaceholderLIB] = [PlaceholderLIB]()

   @IBOutlet weak var cellLabel: UILabel!
   // @IBOutlet weak var cellImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      
 
     
      fillChar()
           
       }

       func fillChar(){
              let urlHolder: URL = URL(string: "https://jsonplaceholder.typicode.com/photos")!
                    
            let data = try! Data(contentsOf: urlHolder)
            let json: JSON = JSON(data)
            for (_, value) in json{
               let ColorWall = PlaceholderLIB()

                  ColorWall.title = value["title"].stringValue
                  ColorWall.Image = value["thumbnailUrl"].stringValue
                
                charDic.append(ColorWall)
                  
              }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
     
    }

   
    

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charDic.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let objectTitle = charDic[indexPath.row].title
               cell.textLabel!.text = objectTitle
        let url = URL(string: charDic[indexPath.row].Image)
        guard let urlfordata = url else {
            print("fail to load image")
            return cell}
        if let data = try? Data(contentsOf: urlfordata){
            cell.imageView!.image = UIImage(data: data)
            }
           
return cell
            }
        
    }
    



