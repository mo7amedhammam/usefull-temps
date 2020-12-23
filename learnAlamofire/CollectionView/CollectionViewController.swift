//
//  CollectionViewController.swift
//  learnAlamofire
//
//  Created by Muhammad Hammam on 20/12/2020.
//

import UIKit

class CollectionViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    @IBOutlet weak var collectionOut: UICollectionView!
    
    let tableObject : ViewController? = nil  // to access value inside another VC
    
    var name = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionOut.delegate = self
        collectionOut.dataSource = self
        
        self.collectionOut.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellid")

    }

     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionOut.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.colCellLAble.text = "medo"
        cell.collCellContainer.backgroundColor = .systemOrange
        cell.collCellContainer.layer.cornerRadius = 13
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let tableVobject = (self.storyboard?.instantiateViewController(withIdentifier: "tableViewId") as? ViewController)!
//        self.navigationController?.popToViewController(animated: true)
        self.navigationController?.popViewController(animated: true)
    }

    
}

 
