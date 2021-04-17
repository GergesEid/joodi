//
//  AddReview + Cosmos.swift
//  JOODI
//
//  Created by Gerges on 17/04/2021.
//

import UIKit
import Cosmos

extension AddReviewViewController {
    func addReviewCosmos () {
        viewOfStar.didTouchCosmos = { rating in
            print("Rated: \(rating)")
        }
        
        viewOfStar.didFinishTouchingCosmos = { rating in
            print("\(rating)")
            self.ratingStar = rating
            print("ratingStar: \(self.ratingStar ?? 0)")
        }
    }
}
