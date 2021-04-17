//
//  setUI.swift
//  JOODI
//
//  Created by Gerges on 13/04/2021.
//

import Foundation
import UIKit

extension UIViewController {
    // add border to view empty
    func addBorderToViewEmpty(view: UIView) {
        view.layer.borderWidth = 1
        view.layer.borderColor = #colorLiteral(red: 0.9294117647, green: 0.9294117647, blue: 0.9294117647, alpha: 1)
    }
    
    // add border to view filles
    func addBorderToViewFilled(view: UIView) {
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    // add border to view error
    func addBorderToViewError(view: UIView) {
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.red.cgColor
    }
}
