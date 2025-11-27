//
//  Detail.swift
//  BookWorm
//
//  Created by Jose Rafael Peralta Martinez  on 27/11/25.
//

import SwiftData
import SwiftUI

struct Detail: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var shwoingDeleteAlert: Bool = false
    let book: Book
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre)
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre.uppercased())
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundStyle(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(.capsule)
                    .offset(x: -5, y: -5)
            }
            
            Text(book.author)
                .font(.title)
                .foregroundStyle(.secondary)
            Text(book.review)
                .padding()
            
            Rating(rating: .constant(book.rating))
                .font(.title2)
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert("Delete Book", isPresented: $shwoingDeleteAlert) {
            Button("Delete",role: .destructive,action: deleteBook)
            Button("Cancel",role:.cancel){}
        }message: {
            Text("Are you sure? This action cannot be undone.")
        }
        .toolbar{
            Button("Delete this book",systemImage: "trash"){
                shwoingDeleteAlert = true
            }
        }
    }
    func deleteBook() {
        modelContext.delete(book)
        dismiss()
    }
}

#Preview {
    do{
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let conteiner = try ModelContainer(for: Book.self, configurations: config)
        let example = Book(title: "Test Book", author: "Test Author", genre: "Fantasy", review: "This was a great book; I really enjoyed it.", rating: 4)
        
        return Detail(book: example)
            .modelContainer(conteiner)
    }catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
