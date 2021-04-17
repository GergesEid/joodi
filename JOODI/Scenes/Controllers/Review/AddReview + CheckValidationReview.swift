//
//  AddReview + CheckValidationReview.swift
//  JOODI
//
//  Created by Gerges on 17/04/2021.
//

import UIKit

extension AddReviewViewController {
    // check review validation and post review
    func checkAndPostReview () {
        if ratingStar == nil {
            self.view.makeToast("Please select your rating",duration: 4.0, position: .center)
            return
        }
        
        let message = messageTxtView.text
        print("resaults: \(ratingStar ?? 0), \(message ?? "")")
        presenter.postReview(rate: ratingStar ?? 0.0, message: message ?? "")
    }
}
