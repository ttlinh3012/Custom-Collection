//
//  ViewController.swift
//  TLUltravisual
//
//  Created by Tran Tuan Linh on 07/11/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectioView: UICollectionView!
    var imageArray: [String] = ["banner1","banner2","banner3","banner4","banner5","banner6"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupCollectionView()
    }
    
    func setupCollectionView() {
        collectioView.delegate = self
        collectioView.dataSource = self
        collectioView.backgroundColor = .clear
        collectioView.register(cellType: InspirationCell.self)
        collectioView.decelerationRate = UIScrollView.DecelerationRate.fast
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
  
    func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(with: InspirationCell.self, for: indexPath)
        cell.imageName = imageArray[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath)
    {
        let layout = collectionView.collectionViewLayout as! UltravisualLayout
        let offset = layout.dragOffset * CGFloat(indexPath.item)
        if collectionView.contentOffset.y != offset {
            print("===> content offset y \(collectionView.contentOffset.y), item offset \(offset)")
            collectionView.setContentOffset(CGPoint(x: 0, y: offset), animated: true)
        }
        else {
            print("xxx - show next")
        }
        // This didn't work beacuse of the changing hights of the cells.
        // collectionView.scrollToItemAtIndexPath(indexPath,
        //                                       atScrollPosition: UICollectionViewScrollPosition.Top,
        //                                       animated: true)
    }
    
}

