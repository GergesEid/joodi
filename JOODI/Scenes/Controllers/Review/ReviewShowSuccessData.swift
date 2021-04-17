//
//  ReviewShowSuccessData.swift
//  JOODI
//
//  Created by Gerges on 17/04/2021.
//

import Foundation

extension AddReviewViewController {
    // action after send data to the server successfully
    func showAlertAndClearData () {
        self.view.makeToast("You review sent successfully, Thanks for your review",duration: 6.0, position: .center)
        viewOfStar.rating = 0
        messageTxtView.text = ""
        addBorderToViewEmpty(view: messageTxtView)
    }
}
