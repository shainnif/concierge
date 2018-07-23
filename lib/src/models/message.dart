class Message {
  final String name;
  final String text;
  String photoURL;
  String imageURL;

  Message(this.name, [this.text, String photoURL, this.imageURL]) {
    this.photoURL = photoURL ?? "https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg";
  }

  Message.fromMap(Map map) :
        this(map['name'], map['text'], map['photoURL'], map['imageURL']);

  Map toMap() => {
    "name": name,
    "text": text,
    "photoURL": photoURL,
    "imageURL": imageURL
  };
}