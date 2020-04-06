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
    
    var name: String?;
    var managerVideo: [Video] = [];
    var managerNews: [News] = [];
    
    var newName: String {
        if let name = self.name {
            return name;
        }
        return self.newName
    }
    
    init(name: String) {
        self.name = name;
    }
    
    func insertVideo(video: Video) {
        managerVideo.append(video);
        print("Vido added successfully");
    }
    
    func insertNews(news: News) {
        managerNews.append(news);
        print("News added successfully");
    }
    
    func toStringVideo() {
        for video in managerVideo {
            print(video.toString());
        }
    }
    
    func toStringNews() {
        for news in managerNews {
            print(news.toString());
        }
    }
    
    func getNews(name: String) -> String {
        for news in managerNews {
            if news.newAuthor.newName == name {
                return "\(news.toString())";
            }
        }
        return "Name not found";
    }
    
    func getVideo(name: String) -> String {
        for video in managerVideo {
            if video.newAuthor.newName == name {
                return "\(video.toString())";
            }
        }
        return "Name not found";
    }
    
    func getCounManager() -> String {
        return "There are \(managerNews.count) news and \(managerVideo.count) video";
    }
    
    func getLastElementNews() -> String {
        return "Last element inserted is \(managerNews[managerNews.endIndex - 1].toString())";
    }
    
    func getLastElementVideo() -> String {
        return "Last element inserted is \n\(managerVideo[managerVideo.endIndex - 1].toString())";
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

"*...Inserted news...*"
manager.insertNews(news: news);
manager.insertNews(news: news1);
print();
"*...Show news...*"
manager.toStringNews();
print();

"*...Inserted video...*"
manager.insertVideo(video: video);
manager.insertVideo(video: video1);
print();
"*...Show video...*"
manager.toStringVideo();
print();

"*...Search news for name author...*"
print(manager.getNews(name: "Gabriele"));
print();
"*...Search video for name author...*"
print(manager.getVideo(name: "Sergio"));
print();

"*...Get number elemnt into manager...*"
print(manager.getCounManager());
print();

"*...Get the last inserted news...*"
print(manager.getLastElementNews());
print();

"*...Get the last inserted video...*"
print(manager.getLastElementVideo());
