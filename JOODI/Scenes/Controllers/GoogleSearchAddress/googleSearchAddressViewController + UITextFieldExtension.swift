//
//  googleSearchAddressViewController + UITextFieldExtension.swift
//  JOODI
//
//  Created by Gerges on 16/04/2021.
//

import UIKit

extension googleSearchAddressViewController {
    // search resaults
    @objc func searchPlaceFromGoogle(_ textField:UITextField){
        resultsArray = []
        if let searchQuery = textField.text {
            // neeed paid key instead of ****************
            var StrGoogleApi = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=\(searchQuery)&key=****************"
            StrGoogleApi = StrGoogleApi.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            var urlRequest = URLRequest(url: URL(string: StrGoogleApi)!)
            urlRequest.httpMethod = "GET"
            let task = URLSession.shared.dataTask(with: urlRequest) { (data, response , error) in
                if error == nil{
                    let jsonDict = try? JSONSerialization.jsonObject(with: data! , options: .mutableContainers)
                    if let dict = jsonDict as? Dictionary<String, AnyObject>{
                        
                        if let results = dict["results"] as? [Dictionary<String, AnyObject>] {
                            print("json == \(results)")
                            self.resultsArray.removeAll()
                            for dct in results {
                                self.resultsArray.append(dct)
                            }
                            DispatchQueue.main.async {
                                self.tableV.reloadData()
                            }
                        }
                    }
                }
                else {
                }
            }
            task.resume()
        }
    }
    
}
