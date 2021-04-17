//
//  AddReview + UITextViewExtension.swift
//  JOODI
//
//  Created by Gerges on 17/04/2021.
//

import UIKit

extension AddReviewViewController: UITextViewDelegate {
    // MARK:- UITextView Delegate
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView == messageTxtView {
            addBorderToViewFilled(view: messageTxtView)
            print("textViewDidBeginEditing")
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView == messageTxtView {
            addBorderToViewEmpty(view: messageTxtView)
            print("textViewDidEndEditing")
        }
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        if textView == messageTxtView {
            print("true")
            checkAndPostReview()
        }
        return true
    }
}
