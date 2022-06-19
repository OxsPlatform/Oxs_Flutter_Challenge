

class ImageModel {
  String? url;
  String? type;
  String? expression;
  String? width;
  String? height;
  String? description;

  ImageModel.fromMap(Map<String, dynamic> map) {
    url = map['url'];
    type = map['type'];
    expression = map['expression'];
    width = map['width'];
    height = map['height'];
    description = map['description'];
  }
}

class Article {
  String? title;
  String? link;
  String? description;
  String? author;
  String? pubDate;
  // List<String>? category;
  ImageModel? image;

  Article.fromMap(Map<String, dynamic> map) {
    title = map['title'];
    link = map['link'];
    description = map['description'];
    author = map['author'];
    pubDate = map['pubDate'];
    // category = map['category'];
    image = ImageModel.fromMap(map['image']);
  }

}
