//
//  CollectionViewController.swift
//  learnAlamofire
//
//  Created by Muhammad Hammam on 20/12/2020.
//

import UIKit
 
class  MainVCCollectionView: UIViewController{

    @IBOutlet weak var sliderCollectionViewOutlet: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var scrollingTimer : Timer?
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewSetup()
        registerCells()
        beginScrilling()
        pageControl.numberOfPages = 5

    }

    
    
    
    func beginScrilling() {
        scrollingTimer = Timer.scheduledTimer(timeInterval: 2.5 , target: self, selector: #selector(getnextIndex), userInfo: nil, repeats: true)
    }
    
    @objc func getnextIndex(){
        if (currentIndex < 5){
            currentIndex += 1
      }
       else {
            currentIndex = 0
        }
        sliderCollectionViewOutlet.scrollToItem(at: IndexPath(item: currentIndex, section: 0), at: .centeredHorizontally, animated: true)
            pageControl.currentPage = currentIndex
    }
    
    
    func collectionViewSetup(){
        sliderCollectionViewOutlet.delegate = self
        sliderCollectionViewOutlet.dataSource = self
        
    }
    
    func registerCells(){
        sliderCollectionViewOutlet.registerCell(cellClass: HomeSlider.self ) //Extension handles sThis
    }
    
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
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}


 
