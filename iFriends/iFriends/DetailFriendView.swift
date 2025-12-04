//
//  DetailFriendView.swift
//  iFriends
//
//  Created by Jose Rafael Peralta Martinez on 04/12/25.
//

import SwiftUI

struct TextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.primary)
    }
}

struct backGround: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color(.secondarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 14))
    }
}

extension View {
    public func cardStyle() -> some View {
        self.modifier(backGround())
    }
}

struct DetailFriendView: View {
    let user: Users
    let allUsers: [Users]
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                HStack {
                    Image(systemName: "person.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .padding(30)
                    
                    VStack {
                        Text(user.name)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text(user.isActive ? "Activo" : "Inactivo")
                            .font(.headline)
                            .padding(.horizontal)
                            .background(user.isActive ? Color.green : Color.gray)
                            .clipShape(Capsule())
                            .foregroundColor(.white)
                    }
                    .padding()
                }
                .cardStyle()
                
                HStack(alignment: .top, spacing: 30) {
                    
                    // =====================================================
                    // COLUMNA IZQUIERDA (About, Contact, Tags)
                    // =====================================================
                    VStack(alignment: .leading, spacing: 20) {
                        
                        // About
                        VStack(alignment: .leading) {
                            Text("About")
                                .font(.headline)
                            
                            Text(user.about)
                                .font(.body)
                                .lineSpacing(6)
                                .foregroundStyle(.secondary)
                                .multilineTextAlignment(.leading)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .cardStyle()
                        }
                        .frame(width: 250)
                        
                        // Contact
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Contact information")
                                .font(.headline)
                            
                            VStack(alignment: .leading, spacing: 5) {
                                HStack {
                                    Text("Email:")
                                        .font(.headline)
                                    Text(user.email)
                                        .font(.subheadline)
                                        .lineLimit(1)
                                        .minimumScaleFactor(0.8)
                                }
                                HStack {
                                    Text("Address:")
                                        .font(.headline)
                                    Text(user.address)
                                        .font(.subheadline)
                                        .lineLimit(1)
                                }
                                HStack {
                                    Text("Phone:")
                                        .font(.headline)
                                    Text("(552) 123-4567")
                                        .font(.subheadline)
                                }
                            }
                            .padding(.vertical)
                            .frame(width: 250)
                            .cardStyle()
                        }
                        
                        // Tags
                        VStack(alignment: .leading) {
                            Text("Tags")
                                .font(.headline)
                            
                            LazyVGrid(columns: [
                                GridItem(.adaptive(minimum: 80), spacing: 8)
                            ], spacing: 8) {
                                ForEach(user.tags, id: \.self) { tag in
                                    Text(tag)
                                        .font(.caption)
                                        .padding(.vertical, 6)
                                        .padding(.horizontal, 12)
                                        .background(Color(.secondarySystemFill))
                                        .clipShape(Capsule())
                                }
                            }
                            .padding()
                            .frame(width: 250)
                            .cardStyle()
                        }
                    }
                    
                    // =====================================================
                    // COLUMNA DERECHA (AMIGOS)
                    // =====================================================
                    VStack(alignment: .center) {
                        Text("Friends")
                            .font(.headline)
                        
                        VStack (alignment: .leading) {
                            ForEach(user.friends) { friend in
                               
                                if let fullFriendInfo = allUsers.first(where: { $0.id == friend.id }) {
                                    
                                    NavigationLink(value: fullFriendInfo) {
                                        HStack {
                                            Image(systemName: "person.circle")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 40, height: 30)
                                            Text(friend.name)
                                                .font(.caption)
                                                .foregroundColor(.primary)
                                        }
                                        .padding(.vertical, 4)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .navigationTitle("iFriends")
        .navigationBarTitleDisplayMode(.inline)
       
        .navigationDestination(for: Users.self) { selectedUser in
            DetailFriendView(user: selectedUser, allUsers: allUsers)
        }
    }
}

#Preview {
    DetailFriendView(user: Users.example, allUsers: [Users.example])
}
