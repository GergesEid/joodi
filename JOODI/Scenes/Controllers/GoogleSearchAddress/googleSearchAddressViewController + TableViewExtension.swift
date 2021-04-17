//
//  googleSearchAddressViewController + TableViewExtension.swift
//  JOODI
//
//  Created by Gerges on 16/04/2021.
//

import UIKit

extension googleSearchAddressViewController: UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : addressTableViewCell = tableV.dequeueReusableCell(withIdentifier: "place", for: indexPath) as! addressTableViewCell
        if resultsArray.count != 0 {
            let place = self.resultsArray[indexPath.row]
            cell.cellLbl.text = "\(place["name"] as! String) \(place["formatted_address"] as! String)"
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let place = self.resultsArray[indexPath.row]
        textField.text = "\(place["name"] as! String) \(place["formatted_address"] as! String)"
        str = textField.text!
        NotificationCenter.default.post(name: .addresss, object: self)
        NotificationCenter.default.post(name: .savePlace, object: self)

        self.dismiss(animated: true, completion: nil)
    }
    
}
