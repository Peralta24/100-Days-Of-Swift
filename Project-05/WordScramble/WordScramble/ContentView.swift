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
            List {
                Section("Spell the word") {
                    TextField("Enter a word", text: $newWord)
                }
                
                Section("Used words") {
                    ForEach(usedWords, id: \.self) { word in
                        Text(word)
                    }
                }
            }
            .navigationTitle(rootWord)
            .onAppear(perform: startGame)
            .onSubmit(addNewWord)
            .alert(errorTitle,isPresented: $showError) {
                Button("OK"){}
            }message: {
                Text(errorMessage)
            }
        }
    }

    
    func addNewWord(){
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else { return }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You cant spell that word from '\(rootWord)'!")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You cant jus make them up you know!")
            return
        }
        
        withAnimation{
            usedWords.insert(answer, at: 0)
        }
        
        newWord = ""
    }
    
    func startGame(){
        if let gameIURL = Bundle.main.url(forResource: "start", withExtension: "txt"){
            if let gameStringUrl = try? String(contentsOf: gameIURL, encoding: .utf8){
                let allWords = gameStringUrl.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "Word"
                return
            }
        }
        fatalError("Could not load star.txt from bundle")
    }
    
    func isOriginal(word : String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempoWord = rootWord
        
        for letter in word {
            if let pos = tempoWord.firstIndex(of: letter) {
                tempoWord.remove(at: pos)
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
    
    func wordError(title:String, message:String) {
        errorTitle = title
        errorMessage = message
        showError = true
    }
    
     
}
#Preview {
    ContentView()
}
