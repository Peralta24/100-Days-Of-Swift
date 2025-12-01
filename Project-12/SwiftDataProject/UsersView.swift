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
        List(users) { user in
            
            HStack {
                Text(user.name)
                
            Spacer()
                
                Text(String(user.jobs.count))
                    .fontWeight(.black)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(Color.blue)
                    .foregroundStyle(.white)
                    .clipShape(Capsule())
            }
        }
        .onAppear(perform:addSample)
    }
    
    init(minimumjoinDate : Date, sortOder : [SortDescriptor<User>]) {
        _users = Query(filter: #Predicate<User> { user in
            user.joinDate > minimumjoinDate
        }, sort: sortOder)
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
    UsersView(minimumjoinDate: .now, sortOder: [SortDescriptor(\User.name)])
        .modelContainer(for: User.self)
}
