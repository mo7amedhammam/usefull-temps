//
//  AlamofireModel.swift
//  learnAlamofire
//
//  Created by Muhammad Hammam on 16/12/2020.
//

import Foundation
import UIKit

class model: Codable {
var data: DataClass?
 var support: Support?
}

// MARK: - DataClass
struct DataClass: Codable {
 var id: Int?
 var name: String?
 var year: Int?
 var color, pantoneValue: String?

 enum CodingKeys: String, CodingKey {
     case id, name, year, color
     case pantoneValue = "pantone_value"
 }
}

// MARK: - Support
struct Support: Codable {
 var url: String
 var text: String
}
