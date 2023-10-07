/* ------------------------- ამოცანა 1 ------------------------- */
// Checking weekdays using enum:
print("1) კვირის დღეები enum-ით")
print("------------------------------")
enum DayOfWeek {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}
func checkDay(_ day: DayOfWeek) {
    switch day {
    case .saturday, .sunday:
        print("\(day) is a weekend.")
    default:
        print("\(day) is a week day.")
    }
}
let dayToCheck = DayOfWeek.wednesday
checkDay(dayToCheck)
print("\n\n")



/* ------------------------- ამოცანა 2 ------------------------- */
// Getting weather recommendation using enum:
print("2) ამინდის რჩევები enum-ით")
print("------------------------------")
enum Weather {
    case sunny(celsius: Float)
    case cloudy(celsius: Float)
    case rainy(celsius: Float)
    case snowy(celsius: Float)
}
func suggestClothing(weather: Weather) {
    switch weather {
    case .sunny(celsius: let celsius):
        print("It's ☀️ outside")
        if(celsius >= 20) {
            print("🌡 is high, Wear something lighter!")
        } else {
            print("But 🌡 is low, Wear something thicker!")
        }
    case .cloudy(celsius: let celsius):
        print("It's ☁️ outside")
        if(celsius >= 20) {
            print("🌡 is high, Wear something lighter!")
        } else {
            print("🌡 is low, Wear something thicker!")
        }
    case .rainy(celsius: let celsius):
        print("It's 🌧 outside")
        if(celsius >= 20) {
            print("🌡 is high, Wear something lighter!\nP.S. Don't forget your umbrella ☂️")
        } else {
            print("But 🌡 is low, Wear something thicker!\nP.S. Don't forget your umbrella ☂️")
        }
    case .snowy(celsius: _):
        print("It's ❄️ outside")
        print("🌡 is low, Wear something thicker!")
    }
}
let currentWeather = Weather.rainy(celsius: 15)
suggestClothing(weather: currentWeather)
print("\n\n")



/* ------------------------- ამოცანა 3 ------------------------- */
// Book structure:
print("3) წიგნების სტრუქტურა")
print("------------------------------")
struct Book {
    var title: String
    var author: String
    var publicationYear: Int
}
func filterBooksByYear(_ books: [Book], published: Int) -> [Book] {
    return books.filter{ $0.publicationYear == published }
}
var books: [Book] = []
let book1 = Book(title: "Harry Potter and the Sorcerer's Stone",
                       author: "J. K. Rowling",
                       publicationYear: 1997)
let book2 = Book(title: "The Lord of the Rings",
                             author: "J. R. R. Tolkien",
                             publicationYear: 1954)
let book3 = Book(title: "The Adventures of Tom Sawyer",
                     author: "Mark Twain",
                     publicationYear: 1876)
let book4 = Book(title: "Adventures of Huckleberry Finn",
                           author: "Mark Twain",
                           publicationYear: 1884)
books.append(book1)
books.append(book2)
books.append(book3)
books.append(book4)
let filteredBooks = filterBooksByYear(books, published: 1876)
for book in filteredBooks {
    print("'\(book.title)' by \(book.author), published in \(book.publicationYear)")
}
print("\n\n")



/* ------------------------- ამოცანა 4 ------------------------- */
// Simulating bank account using structure:
print("4) ბანკის ანგარიშის სტრუქტურა")
print("------------------------------")
struct BankAccount {
    var holderName: String
    var accountNumber: String
    var balance: Double
    
    init(holderName: String, accountNumber: String, balance: Double) {
        self.holderName = holderName
        self.accountNumber = accountNumber
        self.balance = balance
    }
    
    mutating func deposit(amount: Double) {
        if amount > 0 {
            balance += amount
            print("Deposited $\(amount) to \(holderName). New balance: $\(balance)")
        } else {
            print("Invalid amount. Try again!")
        }
    }
    
    mutating func withdraw(amount: Double) {
        if amount > 0 {
            if amount <= balance {
                balance -= amount
                print("$\(amount) withdrawn from \(holderName). New Balance: $\(balance)")
            } else {
                print("Insufficient funds. Your balance is only $\(balance).")
            }
        } else {
            print("Invalid amount. Try again!")
        }
    }
}
var anrisAccount = BankAccount(holderName: "Anri Beridze",
                               accountNumber: "2457892423",
                               balance: 2845.0)
anrisAccount.deposit(amount: 300)
anrisAccount.withdraw(amount: 10000)
anrisAccount.withdraw(amount: anrisAccount.balance)
anrisAccount.deposit(amount: 400)
anrisAccount.withdraw(amount: 200)
print("\n\n")



/* ------------------------- ამოცანა 5 ------------------------- */
// Structure and Enums. Filtering songs array:
print("5) სიმღერების გაფილტვრა")
print("------------------------------")
enum Genre {
    case pop
    case rock
    case jazz
    case blues
    case metal
    case hiphop
}
struct Song {
    var title: String
    var artist: String
    var duration: Double
    var genre: Genre
    var description: String {
        return "'\(title)' by \(artist) (\(duration))."
    }
    lazy var publisher: String = {
        return "\(artist) Records"
    }()
}
func filterByGenre(playlist: [Song], genre: Genre) -> [Song] {
    return playlist.filter{ $0.genre == genre }
}
let billieJean = Song(title: "Billie Jean",
                      artist: "Michael Jackson",
                      duration: 4.53,
                      genre: .pop)
let voodooChild = Song(title: "Voodoo Child (Slight Return)",
                       artist: "Jimi Hendrix",
                       duration: 5.14,
                       genre: .rock)
let johnnyBGoode = Song(title: "Johnny B. Goode",
                        artist: "Chuck Berry",
                        duration: 2.40,
                        genre: .rock)
let georgiaOnMyMind = Song(title: "Georgia on My Mind",
                           artist: "Ray Charles",
                           duration: 3.35,
                           genre: .jazz)
let theThrillIsGone = Song(title: "The Thrill is Gone",
                           artist: "B. B. King",
                           duration: 3.55,
                           genre: .blues)
let crazyTrain = Song(title: "Crazy Train",
                      artist: "Ozzy Osbourne",
                      duration: 4.52,
                      genre: .metal)
let nothingElseMatters = Song(title: "Nothing Else Matters",
                              artist: "Metallica",
                              duration: 6.28,
                              genre: .metal)
let loseYourself = Song(title: "Lose Yourself",
                        artist: "Eminem",
                        duration: 5.26,
                        genre: .hiphop)
let shookOnes = Song(title: "Shook Ones, Part II",
                     artist: "Mobb Deep",
                     duration: 4.24,
                     genre: .hiphop)
var playlist: [Song] = []
playlist.append(billieJean)
playlist.append(voodooChild)
playlist.append(johnnyBGoode)
playlist.append(georgiaOnMyMind)
playlist.append(theThrillIsGone)
playlist.append(crazyTrain)
playlist.append(nothingElseMatters)
playlist.append(loseYourself)
playlist.append(shookOnes)
let filteredPlaylist = filterByGenre(playlist: playlist, genre: .rock)
for song in filteredPlaylist {
    print(song.description)
}
