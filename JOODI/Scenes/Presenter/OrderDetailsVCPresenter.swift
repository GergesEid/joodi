//
//  OrderDetailsVCPresenter.swift
//  JOODI
//
//  Created by Gerges on 17/04/2021.
//

import Foundation

import UIKit

protocol OrderDetailsView: class {
    func showIndicatorAnimation()
    func hideIndicatorAnimation()
    func fetchingDataSuccess()
    func showError(error: String)
    func displayAllData (name:String, phone:String, time:String, shopper:String, long:Double, lat:Double)
}

protocol ItemsCellView {
    func displayName(name: String)
    func displayCount(count: String)
}

class OrderDetailsVCPresenter {
    
    private weak var view: OrderDetailsView?
    private let interactor = OrderDetailsInteractor()
    private var orderData : OrderDetailsModel?
    var orderId = UserDefaults.standard.integer(forKey: "orderId")
    
    init(view: OrderDetailsView) {
        self.view = view
    }
    
    func viewDidLoad() {
        orderDetails(id: orderId)
    }
    
    func orderDetails(id: Int) {
        // start animation lottie
        view?.showIndicatorAnimation()
        interactor.getOrderDetails(id: id) { [weak self] order, error in
            guard let self = self else { return } //And note this is only available from swift 4.2
            // stop animation lottie
            self.view?.hideIndicatorAnimation()
            if let error = error {
                self.view?.showError(error: error.localizedDescription)
            } else {
                guard let order = order else { return }
                self.orderData = order
                print(self.orderData!)
                self.view?.fetchingDataSuccess()
                let long = order.location?.value?.longitude
                let lat = order.location?.value?.latitude
                self.view?.displayAllData(name: order.name ?? "", phone: order.phoneNumber ?? "", time: order.timeToDeliver ?? "", shopper: order.shopper ?? "", long: long!, lat: lat!)
            }
        }
    }
    
    func getItemsCount() -> Int {
        return (orderData?.items!.count) ?? 0
    }
    
    func configure(cell: ItemsCellView, for index: Int) {
        let item = orderData?.items![index]
        cell.displayName(name: (item?.name)!)
        cell.displayCount(count: "\(item?.count ?? 0)")
    }
    
}
