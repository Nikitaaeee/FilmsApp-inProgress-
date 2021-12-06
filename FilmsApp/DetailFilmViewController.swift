//
//  DetailFilmViewController.swift
//  FilmsApp
//
//  Created by Никита on 25.10.2021.
//

import UIKit

class DetailFilmViewController: UIViewController, UIViewControllerTransitioningDelegate{
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var filmTitleLabel: UILabel!
    @IBOutlet weak var releaseYearLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var galleryCollection: UICollectionView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var receivedIndex: Int = Int()
    
    var transition: RoundingTransition = RoundingTransition()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        posterImageView.image = UIImage(named: testArray[receivedIndex].testPic ?? "image1")
        filmTitleLabel.text = testArray[receivedIndex].testTitle
        releaseYearLabel.text = testArray[receivedIndex].testYear
        ratingLabel.text = testArray[receivedIndex].testRating

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapGestureAction(_ sender: UITapGestureRecognizer) {
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        transition.TransitionProfile = .show
        transition.start = posterImageView.center
        transition.roundColor = UIColor.white
        
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        transition.TransitionProfile = .cancel
        transition.start = posterImageView.center
        transition.roundColor = UIColor.white
        
        return transition
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destVC = segue.destination as? PosterFullViewController else {
            return
            
        }
        destVC.detailIndexPath = receivedIndex
        destVC.transitioningDelegate = self
        destVC.modalPresentationStyle = .custom
        
    }
}
