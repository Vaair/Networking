//
//  WebsiteDescription.swift
//  Networking
//
//  Created by Лера Тарасенко on 23.11.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import Foundation

struct WebsiteDescription: Codable {
    
    let websiteDescription: String?
    let websiteName: String?
    let courses: [Course]
}
