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

    var darshArray = [JSON]()
    @IBOutlet weak var TViewOutLet: UITableView!
    @IBOutlet weak var CellOutlet: UITableViewCell!
    override func viewDidLoad() {
        super.viewDidLoad()
        TViewOutLet.delegate = self
        TViewOutLet.dataSource = self
        
        let url = "https://reqres.in/api/products/3"
//     let url = "https://reqres.in/api/users?page=2"
        AF.request(url).responseJSON{ [self] (res) in
            switch res.result {
            case .success(_):
                let respArr = JSON(res.data!)
                let array = respArr["data"].dictionaryValue    // dictionary
                print(array["name"]!)   //OK >> true red
                print(array["id"]!)    //OK  >> 3
//            }
                self.darshArray.append(array["name"]!)
                TViewOutLet.reloadData()
          	       print("darsh after append \(self.darshArray)")
                 case .failure(_):
                break
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.darshArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID") as! CellVC
        cell.cellLAble.text = "name is: \(self.darshArray[indexPath.row])"
        return cell
    }
}

