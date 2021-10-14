//
//  ContainerView.swift
//  swiftIU-VkClient
//
//  Created by Кирилл Тарасов on 10.10.2021.
//

import SwiftUI

struct ContainerView: View {
    @State private var shouldShowMainView: Bool = false
    
    var body: some View {
        NavigationView {
            HStack {
                LoginView(isUserLoggedIn: $shouldShowMainView)
                
                //MARK: - NAVIGATION LINKS
                NavigationLink(destination: FriendCell(), isActive: $shouldShowMainView) {
                    EmptyView()
                }
            }
        }
    }
}
