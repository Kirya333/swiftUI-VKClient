//
//  Group.swift
//  swiftIU-VkClient
//
//  Created by Кирилл Тарасов on 13.10.2021.
//

import Foundation

class Group: Identifiable {
    let id: UUID = UUID()
    let name: String
    let avatar: String?
    
    init(name: String, avatar: String?) {
        self.name = name
        self.avatar = avatar
    }
}
