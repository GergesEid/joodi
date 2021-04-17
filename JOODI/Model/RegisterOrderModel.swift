//
//  RegisterOrderModel.swift
//  JOODI
//
//  Created by Gerges on 17/04/2021.
//

import Foundation
struct RegisterOrderModel : Codable {
    let id : Int?
    let name : String?
    let phoneNumber : String?
    let timeToDeliver : String?
    let shopper : String?
    let location : Location?
    let items : [Items]?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case phoneNumber = "phoneNumber"
        case timeToDeliver = "timeToDeliver"
        case shopper = "shopper"
        case location = "location"
        case items = "items"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        phoneNumber = try values.decodeIfPresent(String.self, forKey: .phoneNumber)
        timeToDeliver = try values.decodeIfPresent(String.self, forKey: .timeToDeliver)
        shopper = try values.decodeIfPresent(String.self, forKey: .shopper)
        location = try values.decodeIfPresent(Location.self, forKey: .location)
        items = try values.decodeIfPresent([Items].self, forKey: .items)
    }

}


struct Items : Codable {
    let name : String?
    let count : Int?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case count = "count"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        count = try values.decodeIfPresent(Int.self, forKey: .count)
    }

}


struct Location : Codable {
    let type : Int?
    let value : Value?

    enum CodingKeys: String, CodingKey {

        case type = "type"
        case value = "value"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decodeIfPresent(Int.self, forKey: .type)
        value = try values.decodeIfPresent(Value.self, forKey: .value)
    }

}


struct Value : Codable {
    let latitude : Double?
    let longitude : Double?

    enum CodingKeys: String, CodingKey {

        case latitude = "latitude"
        case longitude = "longitude"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        latitude = try values.decodeIfPresent(Double.self, forKey: .latitude)
        longitude = try values.decodeIfPresent(Double.self, forKey: .longitude)
    }

}
