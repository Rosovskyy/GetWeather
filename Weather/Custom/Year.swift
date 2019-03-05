//
//  Year.swift
//  TableViewPractice
//
//  Created by Serhiy Rosovskyy on 3/5/19.
//  Copyright © 2019 UCU. All rights reserved.
//

import Foundation


struct Year {
    let year: String?
    var mm: [Month]
}

struct Month {
    let number: String?
    let tmax: String?
    let tmin: String?
    let af: String?
    let rain: String?
    let sun: String?
}
