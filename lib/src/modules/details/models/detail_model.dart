class DetailModel {
  final String? id;
  final String? title;
  final List<String>? author;
  final String? thumbnail;

  const DetailModel({
    this.id,
    this.title,
    this.author,
    this.thumbnail,
  });

  factory DetailModel.fromJson(Map<String, dynamic> json) {
    final authors = json['volumeInfo']['authors'];
    final imageLinks = json['volumeInfo']['imageLinks'];

    return DetailModel(
      id: json['id'] ?? '',
      title: json['volumeInfo']['title'] ?? '',
      author: authors != null ? List<String>.from(authors) : ['unknown Author'],
      thumbnail: imageLinks != null && imageLinks['thumbnail'] != null
          ? imageLinks['thumbnail']
          : '',
    );
  }
}
