//
//  OrderDetailsInteractor.swift
//  JOODI
//
//  Created by Gerges on 17/04/2021.
//

import Foundation

import Alamofire

class OrderDetailsInteractor {
    
    func getOrderDetails(id:Int, completion: @escaping (OrderDetailsModel?, Error?) -> ()) {
        let url = "https://60719d9350aaea0017284d61.mockapi.io/api/Orders/\(id)"
        AF.request(url,method: .get, encoding : JSONEncoding.default,headers:nil).responseDecodable { (response: AFDataResponse<OrderDetailsModel>) in
            let result = response.result
            print("result: \(result)")
            switch result {
            case .success(let order):
                print("success")
                completion(order, nil)
            case .failure(let error):
                print("failure")
                completion(nil, error)
            }
            return
        }
    }
}
