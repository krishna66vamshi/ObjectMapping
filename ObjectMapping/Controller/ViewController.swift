//
//  ViewController.swift
//  ObjectMapping
//
//  Created by vamshi on 24/11/18.
//  Copyright © 2018 vamshi. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import SDWebImage

class ViewController: UIViewController {
    
    let urlString = "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/10/explicit.json"
    
    var myModel = [results]()
    
    @IBOutlet var myTableView:UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       getData()
        
        var itunes:ItunesModel?
      //  print(itunes?.title)
        
    }
    
    
    func getData(){
        
    
        Alamofire.request(URL(string: urlString)!).responseJSON { (response) in
            
            let jsonResponse = response.result
            
            switch jsonResponse{
            case .success:
                guard let finalResponse = jsonResponse.value  else{return}
                print(finalResponse)
                guard let object = Mapper<ItunesModel>().map(JSONObject: finalResponse) else{return}
                
                print("Country",object.country!)
                print("Country",object.name!,object.uri!)

                print("results",object.results!)
                
                guard let results = object.results else{return}
                
                for item in results{
                    self.myModel.append(item)
                }
            
             //   print("myModel",self.myModel)
                DispatchQueue.main.async {
                    self.myTableView.reloadData()
                }
                

            case .failure( let err):
                print(err)
                
                
                
            }
            
        }
    }
}


extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        cell.configureCell(with: myModel[indexPath.row])
        
//        cell.artistNameLabel.text = myModel[indexPath.row].artistName
//        cell.kindLabel.text = myModel[indexPath.row].kind
//        if let url = myModel[indexPath.row].artworkUrl100{
//            cell.artistImage.sd_setImage(with: URL(string: url))
//        }
        
    return cell
        
        
        
    }
    
    
    
    
    
    
}

