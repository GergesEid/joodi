//
//  ReviewVCPresenter.swift
//  JOODI
//
//  Created by Gerges on 17/04/2021.
//

import Foundation
import UIKit

protocol ReviewView: class {
    func showIndicatorAnimation()
    func hideIndicatorAnimation()
    func fetchingDataSuccess()
    func showDataSuccess()
    func showError(error: String)
}


class ReviewVCPresenter {
    
    private weak var view: ReviewView?
    private let interactor = ReviewVCInteractor()
    private var reviewData : [ReviewModel]?
    private var ReviewVC : AddReviewViewController?
    
    init(view: ReviewView) {
        self.view = view
    }
    
    func viewDidLoad() {
    }
    
    func postReview(rate: Double, message: String) {
        // start animation lottie
        view?.showIndicatorAnimation()
        interactor.postAnReview(rate: rate, message: message) { [weak self] reviews, error in
            guard let self = self else { return } //And note this is only available from swift 4.2
            // stop animation lottie
            self.view?.hideIndicatorAnimation()
            if let error = error {
                self.view?.showError(error: error.localizedDescription)
            } else {
                guard let reviews = reviews else { return }
                self.reviewData = reviews
                print(self.reviewData!)
                self.view?.showDataSuccess()
            }
        }
    }
}
