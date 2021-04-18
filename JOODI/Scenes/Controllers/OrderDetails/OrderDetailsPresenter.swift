//
//  OrderDetailsPresenter.swift
//  JOODI
//
//  Created by Gerges on 17/04/2021.
//

import Foundation

extension OrderDetailsViewController: OrderDetailsView {
    
    func showIndicatorAnimation() {
        startAnimationLoading()
    }
    
    func hideIndicatorAnimation() {
        stopAnimationLoading()
    }
    
    func fetchingDataSuccess() {
        itemsTableView.reloadData()
    }
    
    func showError(error: String) {
        print(error)
    }
    
    func displayAllData(name: String, phone: String, time: String, shopper: String, long:Double, lat:Double) {
        nameLbl.text = "Name: \(name)"
        phoneLbl.text = "Phone Number: \(phone)"
        timeLbl.text = "Time To Deliver: \(time)"
        shopperLbl.text = "Shopper: \(shopper)"
        // save location data
        longitude = long
        latitude = lat
    }
}
