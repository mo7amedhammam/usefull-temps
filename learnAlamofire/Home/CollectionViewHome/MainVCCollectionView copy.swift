//
//  CollectionViewController.swift
//  learnAlamofire
//
//  Created by Muhammad Hammam on 20/12/2020.
//

import UIKit
 
class  MainVCCollectionView: UIViewController{

    @IBOutlet weak var sliderCollectionViewOutlet: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewSetup()
        registerCells()

    }

    
    func collectionViewSetup(){
        sliderCollectionViewOutlet.delegate = self
        sliderCollectionViewOutlet.dataSource = self
        
    }
    
    func registerCells(){
        sliderCollectionViewOutlet.registerCell(cellClass: HomeSlider.self ) //Extension handles sThis
    }
    
//    init() {
//        super.init(nibName: "HomeSlider", bundle: nil)
//    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
    
}

// colection Settings
extension MainVCCollectionView:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = sliderCollectionViewOutlet.dequeue(indexPath: indexPath) as HomeSlider //Extension handles sThis
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      return  sliderCollectionViewOutlet.bounds.size //returns size of collectionView
////        return CGSize(width: view.frame.width, height: view.frame.height - 100.0)
    }
    
}


 
