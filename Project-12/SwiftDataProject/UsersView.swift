//
//  UsersView.swift
//  SwiftDataProject
//
//  Created by Jose Rafael Peralta Martinez  on 01/12/25.
//

import SwiftData
import SwiftUI

struct UsersView: View {
    @Environment(\.modelContext) var modelContext
    @Query var users : [User]
    var body: some View {
        List{
            ForEach(users) {user in
                HStack {
                    Text(user.name)
                    
                    Spacer()
                    
                    Text(String(user.jobs.count))
                    
                    
                }
            }
            .onDelete(perform: deleteUser)
            .onAppear(perform:addSample)

        }
    }
    
    init(minimumJoinDate: Date,sortOrder : [SortDescriptor<User>]) {
        _users = Query(filter: #Predicate<User>{user in
            user.joinDate >= minimumJoinDate
        }, sort: sortOrder)
    }
    
    func deleteUser(offset: IndexSet) {
        for index in offset {
            let user = users[index]
            modelContext.delete(user)
        }
    }
    func addSample(){
           let user = User(name: "Rafael Peralta", city: "New zeealand", joinDate: .now)
           let job1 = Job(name: "Ux/uI", priority: 4)
           let job2 = Job(name: "Swift", priority: 3)
           
           modelContext.insert(user)
           user.jobs.append(job1)
           user.jobs.append(job2)
       }
}

#Preview {
    UsersView(minimumJoinDate: Date.now,sortOrder: [
        SortDescriptor(\User.name),
        SortDescriptor(\User.joinDate)
    ])
}
