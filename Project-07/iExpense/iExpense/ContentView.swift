import SwiftUI


struct ExpenseItem : Identifiable, Codable {
    var id = UUID()
    let name: String
    let type : String
    let amount: Double
}

@Observable
class Expenses {
    var items  = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decoded = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decoded
                return
            }
        }
        items = []
    }
}

struct ContentView: View {
    
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    var body: some View {
        NavigationStack {
            List{
                ForEach(expenses.items){item in
                        Text(item.name)
                }
                .onDelete(perform: removingExpense)
            }
            .navigationTitle(Text("iExpenses"))
            .toolbar {
                Button("Add expens",systemImage: "plus"){
                    showingAddExpense = true
                }
            }
            .sheet(isPresented: $showingAddExpense){
                AddView(expenses: expenses)
            }
        }
    }
    func removingExpense(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}
#Preview {
    ContentView()
}
//ExpenseItem
//Expenses
//removingExpense
