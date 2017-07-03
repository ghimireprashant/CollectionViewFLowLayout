//
//  ViewController.swift
//  CollectionViewDemo
//
//  Created by Prashant Ghimire on 7/3/17.
//  Copyright © 2017 prashant.ghimire@gmail.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var collectionViewBottonConstant: NSLayoutConstraint!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
//    collectionView.setScaledDesginParam(scaledPattern: .VerticalTop, maxScale: 1.2, minScale: 0.5, maxAlpha: 1.0, minAlpha: 0.5)
    collectionView.setScaledDesginParam(scaledPattern: .VerticalTop, maxScale: 1, minScale: 1, maxAlpha: 1.0, minAlpha: 0.5)
    perform(#selector(updateCollectionView), with: nil, afterDelay: 0)
  }

  func updateCollectionView() {
    collectionView.scaledVisibleCells()
  }

}
extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath)as! CustomCell
    cell.backgroundColor = UIColor.red
    return cell
  }
 func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    if indexPath.row == 10 - 1 {
//      self.collectionViewBottonConstant.constant = self.collectionView.frame.height / 2
    }else{
//      self.collectionViewBottonConstant.constant = self.collectionView.frame.height
    }
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.size.width, height:collectionView.frame.size.height/2)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return .zero
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
}

extension ViewController: UIScrollViewDelegate {
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    collectionView.scaledVisibleCells()
  }
}
class CustomCell : UICollectionViewCell{
  
}
