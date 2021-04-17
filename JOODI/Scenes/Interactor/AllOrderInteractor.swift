//
//  AllOrderInteractor.swift
//  JOODI
//
//  Created by Gerges on 17/04/2021.
//

import Foundation
import Alamofire

class AllOrderInteractor {
    
    func getAllOrders(completion: @escaping ([AllOrderModel]?, Error?) -> ()) {
        let url = "https://60719d9350aaea0017284d61.mockapi.io/api/Orders"
        AF.request(url,method: .get, encoding : JSONEncoding.default,headers:nil).responseDecodable { (response: AFDataResponse<[AllOrderModel]>) in
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
