//
//  AnReviewPresenter.swift
//  JOODI
//
//  Created by Gerges on 17/04/2021.
//

import Foundation

extension AddReviewViewController: ReviewView {
    
    func showIndicatorAnimation() {
        startAnimationLoading()
    }
    
    func hideIndicatorAnimation() {
        stopAnimationLoading()
    }
    
    
    func fetchingDataSuccess() {
    }
    
    func showDataSuccess() {
        showAlertAndClearData()
    }
    
    func showError(error: String) {
        print(error)
    }
    
}
