//
//  CollectionViewController.swift
//  learnAlamofire
//
//  Created by Muhammad Hammam on 20/12/2020.
//

import UIKit
 
class  MainVCCollectionView: UIViewController, UITableViewDelegate, UITableViewDataSource{
  

    @IBOutlet weak var sliderCollectionViewOutlet: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    
    var scrollingTimer : Timer?
    var currentIndex = 0
    var photosArray = [UIImage(named: "ph1"),UIImage(named: "ph2"),UIImage(named: "ph3"),UIImage(named: "ph4"),UIImage(named: "ph5")]
            
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        collectionViewSetup()
        tableViewSetup()
        registerCells() // collection
        beginScrilling() // Collection
        pageControl.numberOfPages = photosArray.count // Collection
        

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
    func tableViewSetup(){
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
    }
    
    func registerCells(){
        sliderCollectionViewOutlet.registerCell(cellClass: HomeSlider.self ) //Extension handles sThis
        tableViewOutlet.registerCellNib(cellClass: HomeTableViewCell.self) //Extension handles sThis
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        photosArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewOutlet.dequeue() as HomeTableViewCell
        cell.imageView?.image = photosArray[indexPath.row]
        return cell
    }
    
    
    
    
    
    
    
}


// colection Settings
extension MainVCCollectionView:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = sliderCollectionViewOutlet.dequeue(indexPath: indexPath) as HomeSlider //Extension handles sThis
        cell.sliderImage.image = photosArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      return  sliderCollectionViewOutlet.bounds.size    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}


 
