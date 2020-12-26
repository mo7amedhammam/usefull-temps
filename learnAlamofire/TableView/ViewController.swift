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
    
    var head:headerVC? //object from nib Controller Class >> headerVC
    var foot:footerVC? //object from nib Controller Class >> footerVC
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TViewOutLet.delegate = self
        TViewOutLet.dataSource = self
        
        // next 3 lines for the tableViewHeader
        TViewOutLet.tableHeaderView?.frame.size = CGSize(width: TViewOutLet.frame.width, height: CGFloat(55))  //sizing the Header
        head = headerVC.HeaderNibInnerClass()
        TViewOutLet.tableHeaderView = head
        
        TViewOutLet.tableFooterView?.frame.size = CGSize(width: TViewOutLet.frame.width, height: 55)
        foot = footerVC.FooterNibInnerClass()
        TViewOutLet.tableFooterView = foot
        foot?.FooterContainer.layer.cornerRadius = 13
        foot?.FooterContainer.backgroundColor = UIColor.blue
        
//        headerView() //custom header with code
//        FooterView()  //custom footer with code
        
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

    // making sections inside TableView
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 4
//    }
    
//     number Of Rows inside Section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.darshArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID") as! CellVC
        cell.backgroundColor = .purple
//        cell.cellLAble.textColor = .lightText
//        cell.cellLAble.text = "name is: \(self.darshArray[indexPath.row])"
        cell.textLabel!.text = " \(self.darshArray[indexPath.row])"
        return cell
    }
    
    
    // action when selecting tableView Cell/Row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(self.darshArray[indexPath.row])
//        showAlert(title: "Allert Dialog Title", msg: "You Tapped on : \(self.darshArray[indexPath.row])")
        guard let pushBU = self.storyboard?.instantiateViewController(withIdentifier: "MainVCCollectionView") else { return }
        self.navigationController?.pushViewController(pushBU, animated: true)

    }
    
    
    // Header High in Section
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 55
//    }
//
    
    //Custom View for TableView Header
//    func headerView() {
//        let headerV = UIView()
//        headerV.backgroundColor = UIColor.blue
//        headerV.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 50)
//        TViewOutLet.tableHeaderView = headerV
//    }
//
    //Custom View for TableView footer
//    func FooterView() {
//        let Footerv = UIView()
//        Footerv.backgroundColor = UIColor.green
//        Footerv.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 50)
//        TViewOutLet.tableFooterView = Footerv
//    }

}

//extension BasicListViewController: UIViewController,UINavigationController {
//
//// Show selected SFSymbol's name
//        let alert = UIAlertController(title: "allert Title",
//                                      message: "",
//                                      preferredStyle: .alert)
//
//        let okAction = UIAlertAction(title:"OK", style: .default, handler: { (_) in
//            // Deselect the selected cell
//print("allertButti=onPressed")
//
//        })
//    alert.addAction()
//
//present(alert, animated: true, completion:nil)
//
//}


//Alert function in shared class
extension UIViewController {
    func showAlert(title: String, msg: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}





