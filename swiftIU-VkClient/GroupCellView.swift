//
//  GroupCellView.swift
//  swiftIU-VkClient
//
//  Created by Кирилл Тарасов on 13.10.2021.
//

import SwiftUI

struct GroupCellView: View {
    let group: Group
    
    var body: some View {
        HStack {
            AvatarImage {
                Image("\(self.group.avatar ?? "community")")
            }

            Text("\(self.group.name)")
            
            Spacer()
        }
        .lineLimit(1)
    }
}

struct GroupCellView_Previews: PreviewProvider {
    static var previews: some View {
        GroupCellView(group: Group(name: "Swift for junior", avatar: "camera"))
    }
}
