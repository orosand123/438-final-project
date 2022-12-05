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

    

    var imageHelpArray = ["help1", "help2", "help3", "help4", "help5", "help6"]
    var imagePosition = 0
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return imageHelpArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.image.image = UIImage(named: imageHelpArray[indexPath.row])

        
        return cell
    }

}

