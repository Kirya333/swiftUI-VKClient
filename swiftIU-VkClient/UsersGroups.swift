//
//  UsersGroups.swift
//  swiftIU-VkClient
//
//  Created by Кирилл Тарасов on 09.10.2021.
//

import SwiftUI

struct UsersGroups: View {
    var body: some View {
        HStack {
            AvatarImage {
                Image("community")
            }
            
            Text("Group name")
            
            Spacer()
        }
    }
}

struct UsersGroups_Previews: PreviewProvider {
    static var previews: some View {
        UsersGroups()
    }
}
