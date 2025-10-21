import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showError: Bool = false
    var body: some View {
        

        NavigationStack {
            List{
                Section("Word to spell"){
                    TextField("Enter a word",text: $newWord)
                }
                Section("Used Words"){
                    ForEach(usedWords, id: \.self) { word in
                            Text(word)
                    }
                }
            }
            .alert(errorTitle, isPresented: $showError){
                Button("Ok"){}
            }message: {
                Text(errorMessage)
            }
            .onSubmit(addNewWord)
            .onAppear(perform: loadGame)
            .navigationTitle(rootWord)
        }
        
    }
    
    func addNewWord() {
        let wordNew = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard wordNew.count > 0 else { return }

        guard isOriginal(word: wordNew) else {
            wordError(title: "Error not original", message: "Think some original")
            return
        }
        guard isPossible(word: wordNew) else {
            wordError(title: "Error not possible", message: "Think some possible")
            return
        }
        
        guard isReal(word: wordNew) else {
            wordError(title: "Error not real", message: "Think some real")
            return
        }
        usedWords.insert(wordNew, at: 0)
        
        
        newWord = ""
    }
    
    func loadGame() {
        if let urlGame = Bundle.main.url(forResource: "start", withExtension: "txt"){
            if let urlSting = try? String(contentsOf: urlGame, encoding: .utf8){
                let allWords = urlSting.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "Error"
                return
            }
        }
        fatalError("Could no load star.txt")
    }
    
    func isOriginal(word : String) -> Bool {
        !usedWords.contains(word)
    }
    func isPossible(word: String) -> Bool {
        var tempLetter = rootWord
        
        for letter in word {
            if let pos = tempLetter.firstIndex(of: letter){
                tempLetter.remove(at: pos)
            }else{
                return false
            }
        }
        return true
    }
    
    func isReal(word: String) -> Bool {
        
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let mispelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return mispelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String){
        errorTitle = title
        errorMessage = message
        showError = true
    }
    
    
}
#Preview {
    ContentView()
}
