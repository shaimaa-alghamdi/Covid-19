//
//  Structs.swift
//  StayHome
//
//  Created by shaimaa on 29/07/1441 AH.
//  Copyright © 1441 shaimaa12. All rights reserved.
//

import UIKit

class All : Codable {
    var countrydata : [totalData]
}
//GET From API .
struct totalData : Codable {
    let total_cases : Int
    let total_recovered : Int
    let total_unresolved: Int
    let total_deaths: Int
    let total_new_cases_today: Int
    let total_new_deaths_today: Int
    let total_active_cases: Int
    let total_serious_cases: Int
}
 
extension UIColor {
    static let mainColor = UIColor(red: 0.9333, green: 0.8039, blue: 0.4706, alpha: 1.0)
    static let grayColor = UIColor(red: 0.9451, green: 0.949, blue: 0.9608, alpha: 1.0)
    static let iconColor = UIColor(red: 162/255, green: 168/255, blue: 192/255, alpha: 1.0)
    static let redColor = UIColor(red: 232/255, green: 115/255, blue: 111/255, alpha: 1.0)
    static let pinkColor = UIColor(red: 0.4784, green: 0.2667, blue: 0.4941, alpha: 1.0)
}
