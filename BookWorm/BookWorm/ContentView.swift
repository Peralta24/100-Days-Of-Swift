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
    @Query var books : [Book]
    
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
                                
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationTitle("BookWorm")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Book", systemImage: "plus") {
                        showingAddScreen.toggle()
                    }
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                AddBook()
            }
        }
    }
}

#Preview {
    ContentView()
}
