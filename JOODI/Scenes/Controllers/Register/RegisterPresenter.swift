//
//  RegisterPresenter.swift
//  JOODI
//
//  Created by Gerges on 15/04/2021.
//

import Foundation
extension RegisterAnOrdeerViewController: RegisterView {
    
    func showIndicatorAnimation() {
        startAnimationLoading()
    }
    
    func hideIndicatorAnimation() {
        stopAnimationLoading()
    }
    
    
    func fetchingDataSuccess() {
        setDropDown()
    }
    
    func showDataSuccess() {
        showAlertAndClearData()
    }
    
    func showError(error: String) {
        print(error)
    }
    
}
