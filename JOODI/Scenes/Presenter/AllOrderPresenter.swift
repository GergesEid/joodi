//
//  AllOrderPresenter.swift
//  JOODI
//
//  Created by Gerges on 17/04/2021.
//

import Foundation
import UIKit

protocol AllOrdersView: class {
    func showIndicatorAnimation()
    func hideIndicatorAnimation()
    func fetchingDataSuccess()
    func showDataSuccess()
    func showError(error: String)
    func navigateToUserDetailsScreen(order: Int)
}

protocol OrdersCellView {
    func displayName(name: String)
    func displayPhone(phone: String)
    func displayTime(time: String)
    func displayShopper(shopper: String)
}

class AllOrdersVCPresenter {
    
    private weak var view: AllOrdersView?
    private let interactor = AllOrderInteractor()
    private var ordersData = [AllOrderModel]()
    
    init(view: AllOrdersView) {
        self.view = view
    }
    
    func viewDidLoad() {
        allOrders()
    }
    
    func allOrders() {
        // start animation lottie
        view?.showIndicatorAnimation()
        interactor.getAllOrders { [weak self] orders, error in
            guard let self = self else { return } //And note this is only available from swift 4.2
            // stop animation lottie
            self.view?.hideIndicatorAnimation()
            if let error = error {
                self.view?.showError(error: error.localizedDescription)
            } else {
                guard let orders = orders else { return }
                self.ordersData = orders
                print(self.ordersData)
                self.view?.fetchingDataSuccess()
            }
        }
    }
    
    func getOrdersCount() -> Int {
        return ordersData.count
    }
    
    func configure(cell: OrdersCellView, for index: Int) {
        let order = ordersData[index]
        cell.displayName(name: order.name!)
        cell.displayPhone(phone:order.phoneNumber!)
        cell.displayTime(time: order.timeToDeliver!)
        cell.displayShopper(shopper: order.shopper!)
    }
    
    func didSelectRow(index: Int) {
        let order = ordersData[index].id
        UserDefaults.standard.setValue(order, forKey: "orderId")
        view?.navigateToUserDetailsScreen(order: order!)
    }
    
}
