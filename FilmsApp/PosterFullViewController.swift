//
//  PosterFullViewController.swift
//  FilmsApp
//
//  Created by Никита on 15.11.2021.
//

import UIKit

class PosterFullViewController: UIViewController {

    @IBOutlet weak var fullPosterImageView: UIImageView!
    
    var detailIndexPath: Int = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fullPosterImageView.image = UIImage(named: testArray[detailIndexPath].testPic ?? "image1")
        
    }
    
    @IBAction func closeButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    


}
