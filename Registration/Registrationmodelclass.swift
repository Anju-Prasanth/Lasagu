//
//  Registrationmodelclass.swift
//  Lasagu
//
//  Created by Arun Vijayan on 14/07/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import Foundation
struct Registration : Codable {
    let status : Bool?
    let message : String?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: CodingKeys.self)
        status = try values?.decodeIfPresent(Bool.self, forKey: .status)
        message = try values?.decodeIfPresent(String.self, forKey: .message)
    }

}
