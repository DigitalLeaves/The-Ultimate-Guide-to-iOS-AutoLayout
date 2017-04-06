//
//  RelativeViewController.swift
//  Ultimate Guide To AutoLayout
//
//  Created by Ignacio Nieto Carvajal on 4/4/17.
//  Copyright © 2017 Digital Leaves. All rights reserved.
//

import UIKit

class RelativeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    // outlets
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!

    // constraints
    @IBOutlet weak var avatarVerticalSpaceConstraint: NSLayoutConstraint!
    
    // data
    var numEntries = 150
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // round the avatar image
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width / 2.0
        
        // set the vertical space constraint
        avatarVerticalSpaceConstraint.constant = avatarImageView.frame.size.width / 2.0
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - UICollectionView DataSource/Delegate methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numEntries
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PictureCollectionViewCell", for: indexPath)
        return cell
    }

    // MARK: - Responsive cell size for UICollectionView
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        let numberOfRows = traitCollection.horizontalSizeClass == .compact ? 3.0 : 5.0
        let cellSpan = 10.0
        
        let sideSize: Double = floor((Double(collectionView.frame.size.height) - ((numberOfRows-1.0)*cellSpan)) / numberOfRows) - cellSpan
        print("Total height: \(collectionView.frame.size.height), side size: \(sideSize)")
        return CGSize(width: sideSize, height: sideSize)
    }
    
    // reacting to transitions.
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView.reloadData()
    }

}
