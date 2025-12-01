//
//  UsersView.swift
//  SwiftDataProject
//
//  Created by Jose Rafael Peralta Martinez  on 01/12/25.
//

import SwiftData
import SwiftUI

struct UsersView: View {
    
    @Query var users : [User]
    
    var body: some View {
        List(users) { user in
            Text(user.name)
        }
    }
    
    init(minimumjoinDate : Date, sortOder : [SortDescriptor<User>]) {
        _users = Query(filter: #Predicate<User> { user in
            user.joinDate > minimumjoinDate
        }, sort: sortOder)
    }
}

#Preview {
    UsersView(minimumjoinDate: .now, sortOder: [SortDescriptor(\User.name)])
        .modelContainer(for: User.self)
}
