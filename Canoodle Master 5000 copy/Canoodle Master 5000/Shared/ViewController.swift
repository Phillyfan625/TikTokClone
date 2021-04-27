//
//  ViewController.swift
//  Canoodle Master 5000
//
//  Created by Peter Johnson on 4/12/21.
//

import UIKit

class ViewController: UIViewController {
    private var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout)
    }
}
