//
//  ReviewVCInteractor.swift
//  JOODI
//
//  Created by Gerges on 17/04/2021.
//

import Foundation
import Alamofire

class ReviewVCInteractor {
    
    func postAnReview(rate:Double, message:String, completion: @escaping ([ReviewModel]?, Error?) -> ()) {
        let url = "https://60719d9350aaea0017284d61.mockapi.io/api/Reviews"
        AF.request(url,method: .get, encoding : JSONEncoding.default,headers:nil).responseDecodable { (response: AFDataResponse<[ReviewModel]>) in
            let result = response.result
            print("result: \(result)")
            switch result {
            case .success(let reviews):
                print("success")
                completion(reviews, nil)
            case .failure(let error):
                print("failure")
                completion(nil, error)
            }
            return
        }
    }
}
