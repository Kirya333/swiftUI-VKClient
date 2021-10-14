//
//  UsersGroups.swift
//  swiftIU-VkClient
//
//  Created by Кирилл Тарасов on 09.10.2021.
//

import SwiftUI

struct UsersGroups: View {
    @State private var groups: [Group] = [
        Group(name: "Издательство Комильфо", avatar: "camera"),
        Group(name: "Азбука - графические романы. Комиксы. Манга", avatar: nil),
        Group(name: "Комиксы BUBBLE", avatar: nil),
        Group(name: "Eaglemoss", avatar: "camera"),
    ]
    
    var body: some View {
        List(groups.sorted(by: { $0.name < $1.name}), rowContent: { group in
            GroupCellView(group: group)
        })
        .listStyle(.plain)
    }
}

struct GroupsView_Previews: PreviewProvider {
    static var previews: some View {
        UsersGroups()
    }
}
