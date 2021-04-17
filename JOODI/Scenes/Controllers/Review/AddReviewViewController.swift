//
//  AddReviewViewController.swift
//  JOODI
//
//  Created by Gerges on 17/04/2021.
//

import UIKit
import Cosmos

class AddReviewViewController: UIViewController {

    @IBOutlet weak var viewOfStar: CosmosView!
    @IBOutlet weak var messageTxtView: UITextView!
    
    var presenter: ReviewVCPresenter!
    
    var ratingStar:Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter = ReviewVCPresenter(view: self)
        
        addReviewCosmos ()
        setReviewUI ()
        setDelegateReview ()
    }
    
    // set review ui
    func setReviewUI () {
        addBorderToViewEmpty(view: messageTxtView)
    }
    
    // set delegate
    func setDelegateReview () {
        messageTxtView.delegate = self
    }
    
    @IBAction func submitButton(_ sender: Any) {
        checkAndPostReview()
    }
    
}
