//
//  OrderDetails+Location.swift
//  JOODI
//
//  Created by Gerges on 18/04/2021.
//

import UIKit

extension OrderDetailsViewController {
    
    func directionWay () {
        let appDomen: String = "comgooglemaps://"
        let browserDomen: String = "https://www.google.co.in/maps/dir/"
        let directionBody: String = "?saddr=&daddr=\(latitude ?? 0),\(longitude ?? 0)&directionsmode=driving"
        print("long:\(longitude ?? 0), lat:\(latitude ?? 0)")
        // Make route with google maps application
        if let appUrl = URL(string: appDomen), UIApplication.shared.canOpenURL(appUrl) {
            guard let appFullPathUrl = URL(string: appDomen + directionBody) else { return }
            UIApplication.shared.open((NSURL(string:"\(appFullPathUrl)")! as URL), options: [:], completionHandler: nil)
            // If user don't have an application make route in browser
        } else if let browserUrl = URL(string: browserDomen), UIApplication.shared.canOpenURL(browserUrl) {
            guard let browserFullPathUrl = URL(string: browserDomen + directionBody) else { return }
            UIApplication.shared.open((NSURL(string:"\(browserFullPathUrl)")! as URL), options: [:], completionHandler: nil)
        }
    }
}
