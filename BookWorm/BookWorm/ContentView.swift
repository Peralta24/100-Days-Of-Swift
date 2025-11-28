//
//  ContentView.swift
//  BookWorm
//
//  Created by Jose Rafael Peralta Martinez  on 25/11/25.
//
import SwiftData
import SwiftUI

struct ContentView : View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: [
        SortDescriptor(\Book.title),
        SortDescriptor(\Book.author)
    ]) var books : [Book]
    
    @State var showingAddScreen : Bool = false
    var body: some View {
        NavigationStack {
            List{
                ForEach(books){book in
                    NavigationLink(value:book){
                        HStack {
                            EmojiRating(rating: book.rating)
                            
                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .font(.headline)
                                    .foregroundStyle(book.rating == 1 ? .red : .primary)
                                
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteBooks)
            }
            .navigationTitle("BookWorm")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Book", systemImage: "plus") {
                        showingAddScreen.toggle()
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                        EditButton()
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                AddBook()
            }
            .navigationDestination(for: Book.self) { book in
                Detail(book: book)
            }
        }
    }
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            modelContext.delete(book)
        }
    }
}

#Preview {
    ContentView()
}
