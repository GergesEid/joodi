//
//  ShoppersModel.swift
//  JOODI
//
//  Created by Gerges on 13/04/2021.
//

import Foundation

// MARK: - ShoppersModelElement
//struct ShoppersModelElement: Codable {
//    let name: String?
//    let id: Int?
//}
//
//typealias ShoppersModel = [ShoppersModelElement]


struct ShoppersModel : Codable {
    let name : String?
    let id : Int?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case id = "id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
    }

}

