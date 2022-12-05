//
//  HelpViewController.swift
//  438-final-project
//
//  Created by Kevin Chen on 12/4/22.
//

import UIKit
import MapKit

class HelpViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    

    
    @IBOutlet weak var sliderCollectionView: UICollectionView!
//    @IBOutlet weak var pageControllerView: UIPageControl!
    

    var imageHelpArray = ["help1", "help2", "help3"]
    var imagePosition = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        pageControllerView.currentPage = imagePosition
//        pageControllerView.numberOfPages = imageHelpArray.count

    }
    
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        pageControllerView.currentPage = indexPath.row
//        print(pageControllerView.currentPage)
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return imageHelpArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.image.image = UIImage(named: imageHelpArray[indexPath.row])

        
        return cell
    }


    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 358.0 , height: 573.0 )
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//
//        return 0.0
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0.0
//    }



}

