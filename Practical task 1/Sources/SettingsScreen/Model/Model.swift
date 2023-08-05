//
//  Model.swift
//  Practical task 1
//
//  Created by Helena on 8.07.2023.
//

import UIKit

struct Model {
    var title: String
    var subtitle = "Setting status"
    var icon = UIImage(named: "icon")
    var isOn: Bool?
    var additionalInfo: String?
}

extension Model {
    static var allModels: [Model] {
        return [Model(title: "Settings title here", isOn: true),
                Model(title: "Notification", isOn: true),
                Model(title: "Settings title here"),
                Model(title: "Settings title here"),
                Model(title: "Settings title here"),
                Model(title: "About this app", additionalInfo: "v2.0.21")]
    }
}
                

                            
                    
            
