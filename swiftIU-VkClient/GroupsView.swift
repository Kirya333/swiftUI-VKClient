//
//  GroupsView.swift
//  swiftIU-VkClient
//
//  Created by Кирилл Тарасов on 10.10.2021.
//

import SwiftUI

struct GroupsView: View {
    @State private var groups: [Group] = [
        Group(name: "Apple", avatar: "camera"),
        Group(name: "Swift iOS", avatar: nil),
        Group(name: "Marvel", avatar: nil),
        Group(name: "Mobile dev", avatar: "camera"),
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
        GroupsView()
    }
}
