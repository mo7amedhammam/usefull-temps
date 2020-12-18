//
//  ViewController.swift
//  learnAlamofire
//
//  Created by Muhammad Hammam on 16/12/2020.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

//    let arrayobject = []
    var darshArray = [Any]()
    @IBOutlet weak var TViewOutLet: UITableView!
    @IBOutlet weak var CellOutlet: UITableViewCell!
    override func viewDidLoad() {
        super.viewDidLoad()
        TViewOutLet.delegate = self
        TViewOutLet.dataSource = self
        // Do any additional setup after loading the view.
        let url = "https://reqres.in/api/products/3"
//        let url = "https://reqres.in/api/users?page=2"
        AF.request(url).responseJSON{ [self] (res) in
            switch res.result {
            case .success(_):
//             print(res.result)   //OK
        
                let respArr = JSON(res.data!)
                let array = respArr["data"].dictionaryValue    // dictionary
//                var nameArr:[JSON] = array["name"]!.array!    //array
                print(array["name"]!)   //OK
                print(array["year"]!)    //OK
                
//                for i in nameArr.count {
//                    self.darshArray.append(array["name"])
//            }
                self.darshArray.append(array["name"]!)
                print(self.darshArray)
            
            case .failure(_):
                break
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return darshArray.count
//        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID") as! CellVC
//        cell.cellLAble.text = self.darshArray[indexPath.row] as! String
        
        cell.cellLAble.text = "name is\(self.darshArray[indexPath.row])"
        
        return cell
    }
    

}

