//
//  TopBannerCell.swift
//  SarryProject
//
//  Created by omair khan on 14/09/2021.
//


import Foundation
import UIKit
import FSPagerView

//class TopBannerCell : UICollectionViewCell, UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,FSPagerViewDelegate,FSPagerViewDataSource {
   
class TopBannerCell : UICollectionViewCell,FSPagerViewDelegate,FSPagerViewDataSource {
 
    let pageControl : FSPageControl! = {
        var mypager = FSPageControl()
        mypager.contentHorizontalAlignment = .center
        mypager.contentVerticalAlignment = .bottom
        return mypager
    }()
    let pagerView = FSPagerView()
    
    var catalogFirstSection = CatalogViewModel().smartDataArr
    
    private let cellId = "TopBannerSubCell"
    override init(frame: CGRect) {
        super.init(frame: frame)
        pageControl.frame = frame
        pagerView.frame = frame
        print(pageControl.frame, pagerView.itemSize)
        
        setUpView()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init coder has not been implemented")
        
    }
    
    

 
    func setUpView(){
        
        print(pageControl.frame)
        pageControl.updateConstraints()
        backgroundColor = UIColor.red
        pagerView.itemSize = CGSize(width: self.frame.width - 10, height: self.frame.height)
        pagerView.interitemSpacing = 5.0
        pagerView.backgroundColor = .white
        
       // addSubview(topBannerCollectionView)
        addSubview(pagerView)
        addSubview(pageControl)
      //  pageControl.contentHorizontalAlignment = .center
        
        
        // will cover entire height
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":topBannerCollectionView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":pagerView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":pageControl]))
        //Will cover entire width
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": topBannerCollectionView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": pagerView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": pageControl]))
        pagerView.dataSource = self
        pagerView.delegate = self
        pagerView.register(TopBannerSubCell.self, forCellWithReuseIdentifier: cellId)
//        topBannerCollectionView.register(TopBannerSubCell.self, forCellWithReuseIdentifier: cellId)
//        topBannerCollectionView.dataSource = self
//        topBannerCollectionView.delegate  = self
    }
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        print(catalogFirstSection.count)
//
//        return 4
//    }
    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TopBannerSubCell
//       // cell.label.text = catalogFirstSection[indexPath.row].name!
//      //  cell.imageView.addImageFromURL(urlString:catalogFirstSection[indexPath.row].image! )
//        return cell
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: frame.width/1.2, height: frame.height - 10)
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
//    }
    
    
    // MARK: PagerView Data Source
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: cellId, at: index) as! TopBannerSubCell
        cell.imageView?.backgroundColor = .blue
        return cell
    }
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        let count = 3
        pageControl.numberOfPages = count
        return count
    }
    
    func pagerView(_ pagerView: FSPagerView, willDisplay cell: FSPagerViewCell, forItemAt index: Int) {
        pageControl.currentPage = index
    }
}
