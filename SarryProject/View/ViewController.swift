//
//  ViewController.swift
//  SarryProject
//
//  Created by omair khan on 13/09/2021.
//

import UIKit
class ViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
   private let topBannerCellId = "TopBanner"
   private let categoriesCell = "categoriesCell"
   private let bottomBanner = "BottomBanner"
    
    
    
    let bannerVM = BannerViewModel()
    let catalogVM = CatalogViewModel()
    
    
    let segmentedControl : UISegmentedControl = {
        var mySegmentedControl = UISegmentedControl(items: ["Some","Text"])
        if #available(iOS 13, *){
            mySegmentedControl.selectedSegmentTintColor = .darkGray
        }else{
            mySegmentedControl.tintColor = .darkGray
        }
        
        return mySegmentedControl
    }()
    
    var barButton : UIBarButtonItem = {
        var myButton = UIBarButtonItem()
        myButton.image = UIImage(systemName: "cart")
        return myButton
    }()
    
    var searchBarButton : UIBarButtonItem = {
        var myButton = UIBarButtonItem()
        myButton.image = UIImage(systemName: "magnifyingglass")
        return myButton
    }()
    
        let collectionView : UICollectionView = {
        var myCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
            myCollectionView.backgroundColor = .white
            myCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return myCollectionView
    }()
    
       
    
    var smartDataArr : [smartDataType]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
            navigationItem.leftBarButtonItems = [barButton,searchBarButton]
            navigationItem.titleView = segmentedControl
            catalogVM.getSmartDataType {  smartData in
            self.smartDataArr = smartData
            print(self.smartDataArr?.count)
            print(self.smartDataArr as Any)            
            self.collectionView.reloadData()
        }
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(smartDataTypeCell.self, forCellWithReuseIdentifier: "Smart")
        collectionView.register(TopBannerCell.self, forCellWithReuseIdentifier: topBannerCellId)
        collectionView.register(CategoriesCell.self, forCellWithReuseIdentifier: categoriesCell)
        collectionView.register(BottomBanner.self, forCellWithReuseIdentifier: bottomBanner)
        
        self.view.addSubview(collectionView)
        
        let constraints = [
            collectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0)
        ]
        NSLayoutConstraint.activate(constraints)
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return   4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: topBannerCellId, for: indexPath) as! TopBannerCell
            return cell
        }else if indexPath.item == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: categoriesCell, for: indexPath) as! CategoriesCell
            
            cell.categories = (self.smartDataArr?.filter({ smartDataType in
                return smartDataType.dataType == "group"
            })) ?? []
            return cell
            
            if cell.categories.count != 0 {
                cell.categoriesCollectionView.reloadData()
            }
            
            
        }else if indexPath.item == 3 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: bottomBanner, for: indexPath) as! BottomBanner
            
            cell.data = (self.smartDataArr?.filter({ smartDataType in
                return smartDataType.dataType == "banner"
            })) ?? []
            
            if cell.data.count != 0 {
                cell.BottomBannerCollectionView.reloadData()
            }
            
            return cell
            
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Smart", for: indexPath) as! smartDataTypeCell
        
        cell.smartData = (self.smartDataArr?.filter({ smartDataType in
            return smartDataType.dataType == "smart"
        })) ?? []
        
        if cell.smartData.count != 0 {
            cell.smartCollectionView.reloadData()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: self.view.frame.width, height: self.view.frame.height/5)
        }else if indexPath.item == 2 {
            return CGSize(width: self.view.frame.width, height: self.view.frame.height/2)
        }else if indexPath.item == 3 {
            return CGSize(width: self.view.frame.width, height: self.view.frame.height/8)
        }
        
        return CGSize(width: self.view.frame.width, height: 100)
    }
}


