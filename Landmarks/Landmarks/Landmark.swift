//
//  Landmark.swift
//  Landmarks
//
//  Created by 김건호 on 2023/08/02.
//

import Foundation

struct Lanmark : Hashable,Codable {
    var id : Int
    var name : String
    var park : String
    var state : String
    var description : String
}
