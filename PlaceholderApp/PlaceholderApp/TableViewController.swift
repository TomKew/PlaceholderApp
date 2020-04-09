//
//  TableViewController.swift
//  PlaceholderApp
//
//  Created by Field Employee on 4/3/20.
//  Copyright © 2020 Tom Kew-Goodale. All rights reserved.
//

import UIKit
import SwiftyJSON
import SystemConfiguration

class TableViewController: UITableViewController {

    
    var charDic: [[PlaceholderLIB]] = [[PlaceholderLIB]]()
   
    
   //@State private var showingAlert = false

   @IBOutlet weak var cellLabel: UILabel!
   // @IBOutlet weak var cellImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
 
        
       
          fillChar()
        
        
         
     
       }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        if CheckInternet.Connection(){}
        
       else{
                  self.Alert(Message: "Your Device is not connected with internet. Please close this app and reconnect before launching again")
                  
                  
              }
           }
           
           func Alert (Message: String){
               
            let alert = UIAlertController(title: "Alert", message: Message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
               self.present(alert, animated: true, completion: nil)
               
               
           }
    
       func fillChar(){
        
        if CheckInternet.Connection(){
            let urlHolder: URL = URL(string: "https://jsonplaceholder.typicode.com/photos")!
                    
            let data = try! Data(contentsOf: urlHolder)
            let json: JSON = JSON(data)
            for (_, value) in json{
               let ColorWall = PlaceholderLIB()
                
                ColorWall.albumid = value["albumId"].intValue
                ColorWall.title = value["title"].stringValue
                ColorWall.MainImage = value["url"].stringValue
                ColorWall.ThumbImage = value["thumbnailUrl"].stringValue
                
                if(charDic.count < ColorWall.albumid){
                    charDic.append([])
                    charDic[ColorWall.albumid-1].append(ColorWall)
                    }
                else if (charDic.count == ColorWall.albumid){
                    charDic[ColorWall.albumid-1].append(ColorWall)
                }
                
              
            }
        }
       
           
                  
              
    }
 // MARK: - Segues
/*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailView"{
            let detialVC: DetailViewController? = segue.destination as? DetailViewController
            let cell: UITableViewCell? = sender as? UITableViewCell
            
            if cell != nil {
                detialVC?.imageField.image = cell?.imageView!.image
            }
        }
    }
 */

    // MARK: - Table View
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let text = "Album \(section+1)"
        return text
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return charDic.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charDic[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let objectTitle = charDic[indexPath.section][indexPath.row].title
               cell.textLabel!.text = objectTitle
        let url = URL(string: charDic[indexPath.section][indexPath.row].ThumbImage)
        let Mainurl = URL(string: charDic[indexPath.section][indexPath.row].MainImage)
        guard let urlfordata = url else {
            print("fail to load image")
            return cell}
        if let data = try? Data(contentsOf: urlfordata){
            cell.imageView!.image = UIImage(data: data)
            }
           
return cell
            }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let DvC = Storyboard.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        
        let Mainurl = URL(string: charDic[indexPath.section][indexPath.row].MainImage)
        guard let urlfordata = Mainurl else {
            print("fail to load image")
            return
            }
        if let data = try? Data(contentsOf: urlfordata){
            DvC.getimage = UIImage(data: data)!
            }
        
        
        self.navigationController?.pushViewController(DvC, animated: true)
        
        
    }
        
    }
    



