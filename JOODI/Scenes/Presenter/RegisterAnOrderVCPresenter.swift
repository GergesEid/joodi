//
//  RegisterAnOrderVCPresenter.swift
//  JOODI
//
//  Created by Gerges on 15/04/2021.
//

import Foundation
import UIKit

protocol RegisterView: class {
    func showIndicatorAnimation()
    func hideIndicatorAnimation()
    func fetchingDataSuccess()
    func showDataSuccess()
    func showError(error: String)
}

protocol dropDwon {
    func displayName(name: String)
    func displayid(id: Int)
}

class RegisterVCPresenter {
    
    private weak var view: RegisterView?
    private let interactor = RegisterInteractor()
    private var modelData : [ShoppersModel]?
    private var RegisterVC : RegisterAnOrdeerViewController?
    private var ordersData : [RegisterOrderModel]?
    
    init(view: RegisterView) {
        self.view = view
    }
    
    func viewDidLoad() {
        getListOfShoppers()
    }
    
    func getListOfShoppers() {
        // start animation lottie
        view?.showIndicatorAnimation()
        interactor.getApiShoppers { [weak self] shoppers, error in
            guard let self = self else { return } //And note this is only available from swift 4.2
            // stop animation lottie
            self.view?.hideIndicatorAnimation()
            if let error = error {
                self.view?.showError(error: error.localizedDescription)
            } else {
                guard let shoppers = shoppers else { return }
                self.modelData = shoppers
                print(self.modelData!)
                self.view?.fetchingDataSuccess()
            }
        }
    }
    
    func postAnOrder(name: String, phone: String, time: String, shopperId: Int, location:String) {
        // start animation lottie
        view?.showIndicatorAnimation()
        interactor.postRegisterOrder(name: name, phone: phone, time: time, shopperId: shopperId, location: location) { [weak self] orders, error in
            guard let self = self else { return } //And note this is only available from swift 4.2
            // stop animation lottie
            self.view?.hideIndicatorAnimation()
            if let error = error {
                self.view?.showError(error: error.localizedDescription)
            } else {
                guard let orders = orders else { return }
                self.ordersData = orders
                print(self.ordersData!)
                self.view?.showDataSuccess()
            }
        }
    }
    
}
