import UIKit

/*
Comment Kdoc
@author Gabriele Zagarella
@project Article
 
Un sito web di notizie online ti ha richiesto la creazione di un’applicazione per
la visualizzazione nativa dei suoi articoli e feed delle notizie.
• Tutte le notizie hanno un
titolo,
testo,
data di pubblicazione;
autore.
• L’Autore è definito a partire da un nome, cognome e da un indirizzo
web.
Le notizie oltre ad essere di tipo testuale possono essere di tipo Video.
Queste si differenziano perché posseggono un url del video e la durata del
video (oltre alle proprietà classiche).
Quello che devi creare è la struttura delle classi del progetto ed una sorta di
gestore delle notizie. Il gestore delle notizie è in grado di:
• Aggiungere un nuovo articolo o video ad una collezione.
• Restituire la lista di articoli o video dato il nome di un autore.
• Calcolare il numero di video e articoli presenti.
• Restituire l’ultimo articolo o video pubblicato (cioè inserito nel gestore).
*/

class Author {
    
    private var name: String?;
    private var surname: String?;
    private var andress: String?;
    
    var newName: String {
        if let name = self.name {
            return name;
        }
        return self.newName
    }
    
    var newSurname: String {
        if let surname = self.surname {
            return surname;
        }
        return self.newSurname
    }
    
    var newAndress: String {
           if let andress = self.andress {
               return andress;
           }
           return self.newAndress
       }
    
    init(name: String, surname: String, andress: String) {
        self.name = name;
        self.surname = surname;
        self.andress = andress;
    }
    
    func toString() -> String {
        return "Author: \(self.newName), \(self.newSurname), andress: \(self.newAndress)";
    }
}

class News {
    
    private var title: String?;
    private var text: String?;
    private var publicationDate: String?;
    private var author: Author?;
    
    var newTitle: String {
        if let title = self.title {
            return title;
        }
        return self.newTitle
    }
    
    var newTxt: String {
           if let text = self.text {
               return text;
           }
           return self.newTxt
       }
    
    var newPublicationDate: String {
        if let publicationDate = self.publicationDate {
            return publicationDate;
        }
        return self.newPublicationDate
    }
    
    var newAuthor: Author {
        if let author = self.author {
            return author;
        }
        return self.newAuthor
    }
    
    init(title: String, text: String, publicationDate: String, author: Author) {
        self.title = title;
        self.text = text;
        self.publicationDate = publicationDate;
        self.author = author;
       }
    
    func toString() -> String {
        return "News:\n\(newAuthor.toString()),\ntitle: \(self.newTitle), text: \(self.newTxt), publication date: \(self.newPublicationDate)";
    }
}

class Video: News {
    
    private var url: String?;
    private var duration: Double?;
    
    var newUrl: String {
        if let url = self.url {
            return url;
        }
        return self.newUrl
    }
    
    var newDuration: Double {
        if let duration = self.duration {
            return duration;
        }
        return self.newDuration
    }
    
    init(url: String, duration: Double, title: String, text: String, publicationDate: String, author: Author) {
        self.url = url;
        self.duration = duration;
        super.init(title: title, text: text, publicationDate: publicationDate, author: author)
    }
    
    override func toString() -> String {
        return "Video:\n\(newAuthor.toString()),\ntitle: \(self.newTitle), text: \(self.newTxt), publication date: \(self.newPublicationDate), url: \(newUrl), duration: \(newDuration)";
    }
}

class Manager {
    
    private var name: String?;
    private var manager: [News] = [];
    
    var newName: String {
        if let name = self.name {
            return name;
        }
        return self.newName
    }
    
    init(name: String) {
        self.name = name;
    }
    
    func insertArticle(article: News) {
        manager.append(article);
        print("Added successfully");
    }
    
    func toStringArticle() {
        for item in manager {
            print(item.toString());
        }
    }
    
    func getArticle(name: String) -> String {
        var result: String = "";
           for item in manager {
               if item.newAuthor.newName == name {
                    if let video = item as? Video {
                        result += "\(video.toString())";
                    }else {
                        result += "\(item.toString())\n";
                    }
                }
            }
            if result == "" {
                result = "Name not found"
        }
           return result;
       }
    
    func getCountArticle() -> String{
        var countNews = 0;
        var countVideo = 0;
        if manager.count == 0 {
            return "No article presents";
        }
        for item in manager {
            if item is Video {
                countVideo += 1;
            }else if item is News {
                countNews += 1;
            }
        }
        return "There are \(countNews) news and \(countVideo) video";
    }
    
    func getLastElementNews() -> String {
        return "Last element inserted is \(manager[manager.endIndex - 1].toString())";
    }
}

"*...Created author object...*"
var author = Author.init(name: "Sergio", surname: "Bambarén", andress: "Lima-Perù");
var author1 = Author.init(name: "Gabriele", surname: "Zagarella", andress: "Biancavilla");

"*...Created news object...*"
var news = News.init(title: "Inediti", text: "Nuovo album disponibile su tutti gli store", publicationDate: "2020", author: author1);
var news1 = News.init(title: "La musica del silenzio", text: "Ascolta la voce del mare e segui il tuo destino", publicationDate: "2007", author: author);

"*...Created video object...*"
var video = Video.init(url: "www.sergiobambaren.it", duration: 3.2, title: "La musica del silenzio", text: "Ascolta la voce del mare e segui il tuo destino",publicationDate: "2007", author: author);
var video1 = Video.init(url: "www.gabrielezagarella.it", duration: 5.2, title: "New Album", text: "Nuovo album disponibile su tutti gli store", publicationDate: "2020", author: author1);

"*...Created manager object...*"
var manager = Manager.init(name: "OLS");

"*...Inserted article news...*"
manager.insertArticle(article: news);
manager.insertArticle(article: news1);
print();
"*...Show articles...*"
manager.toStringArticle();
print();

"*...Inserted article video...*"
manager.insertArticle(article: video);
manager.insertArticle(article: video1);
print();
"*...Show article...*"
manager.toStringArticle();
print();

"*...Search article for name author...*"
print(manager.getArticle(name: "Gabriele"));
print();
"*...Search article for name author...*"
print(manager.getArticle(name: "Sergio"));
print();

"*...Get number article into manager...*"
print(manager.getCountArticle());
print();

"*...Get the last post..*"
print(manager.getLastElementNews());

