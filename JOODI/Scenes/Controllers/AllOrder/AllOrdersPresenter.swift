//
//  AllOrdersPresenter.swift
//  JOODI
//
//  Created by Gerges on 17/04/2021.
//

import Foundation

extension AllOrdersViewController: AllOrdersView {
    
    func showIndicatorAnimation() {
        startAnimationLoading()
    }
    
    func hideIndicatorAnimation() {
        stopAnimationLoading()
    }
    
    
    func fetchingDataSuccess() {
        allOrdersTableView.reloadData()
    }
    
    func showDataSuccess() {
    }
    
    func showError(error: String) {
        print(error)
    }
    
    func navigateToUserDetailsScreen(order: Int) {
        performSegue(withIdentifier: "AllOrdersToOrderDetailsId", sender: self)
    }
}
