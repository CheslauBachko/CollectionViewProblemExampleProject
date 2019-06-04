//
//  ViewController.swift
//  CollectionViewSwipeAnimationTest
//
//  Created by Cheslau Bachko on 6/4/19.
//

import UIKit

class Cell: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.shouldRasterize = true
        layer.rasterizationScale = 2.0
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let dataSet1 = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
    let dataSet2 = [100, 101,102,103,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120, 121, 122, 123, 124]
    
    var activeDataSet = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activeDataSet = dataSet1
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return activeDataSet.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Default", for: indexPath) as! Cell
        cell.label?.text = "\(activeDataSet[indexPath.row])"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let transition = CATransition()
        
        transition.startProgress = 0
        transition.endProgress = 1.0
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        transition.duration = 0.3
        collectionView.layer.add(transition, forKey: nil)
        activeDataSet = activeDataSet.count == dataSet1.count ? dataSet2 : dataSet1
        collectionView.reloadData()
    }
}




