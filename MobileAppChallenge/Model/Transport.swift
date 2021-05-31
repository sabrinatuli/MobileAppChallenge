//
//  Transport.swift
//  Created by Sabrina Hoque Tuli on 29/5/21.
//

import Foundation
import SwiftUI
import Combine

struct Transport: Codable, Identifiable{
    
    let id = UUID()
    let typeId: Int
    let departureTime: String
    let name: String
    let latitude: Double
    let longitude: Double
    let isExpress: Bool?
    let hasMyKiTopUp: Bool?
   /*
    init(typeId: Int, departureTime: String, name: String, latitude: Double, longitude: Double, isExpress: Bool? = nil, hasMyKiTopUp: Bool? = nil) {
        self.name = name
        self.typeId = typeId
        self.departureTime = departureTime
        self.latitude = latitude
        self.longitude = longitude
        if let unwrappedName = isExpress {
            print("Hello, \(unwrappedName)!")
        } else {
            print("Hello, anonymous!")
        }
        if isExpress != nil  {
            self.isExpress = isExpress!
        } else {
            self.isExpress = isExpress
        }
        
        
        self.hasMyKiTopUp = hasMyKiTopUp
        //self.web = website
        //self.address = address
    }
 */
    
}
