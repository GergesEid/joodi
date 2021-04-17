//
//  RegisterInteractor.swift
//  JOODI
//
//  Created by Gerges on 13/04/2021.
//

import Foundation
import Alamofire

class RegisterInteractor {
    func getApiShoppers(completion: @escaping ([ShoppersModel]?, Error?) -> ()) {
        let url = "https://60719d9350aaea0017284d61.mockapi.io/api/Shoppers"
        AF.request(url,method: .get, encoding : JSONEncoding.default,headers:nil).responseDecodable { (response: AFDataResponse<[ShoppersModel]>) in
            let result = response.result
            print("result: \(result)")
            switch result {
            case .success(let shoppers):
                print("success")
                completion(shoppers, nil)
            case .failure(let error):
                print("failure")
                completion(nil, error)
            }
            return
        }
    }
    
    
    func postRegisterOrder(name:String, phone:String, time:String, shopperId:Int, location:String, completion: @escaping ([RegisterOrderModel]?, Error?) -> ()) {
        let url = "https://60719d9350aaea0017284d61.mockapi.io/api/Orders"
        AF.request(url,method: .get, encoding : JSONEncoding.default,headers:nil).responseDecodable { (response: AFDataResponse<[RegisterOrderModel]>) in
            let result = response.result
            print("result: \(result)")
            switch result {
            case .success(let orders):
                print("success")
                completion(orders, nil)
            case .failure(let error):
                print("failure")
                completion(nil, error)
            }
            return
        }
    }
    
}
