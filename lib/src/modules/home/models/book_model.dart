class BookModel {
  final String title;
  final List<String> author;
  final String thumbnail;

  const BookModel({
    required this.title,
    required this.author,
    required this.thumbnail,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    final authors = json['volumeInfo']['authors'];
    final imageLinks = json['volumeInfo']['imageLinks'];

    return BookModel(
      title: json['volumeInfo']['title'] ?? '',
      author: authors != null ? List<String>.from(authors) : ['unknown Author'],
      thumbnail: imageLinks != null && imageLinks['thumbnail'] != null
          ? imageLinks['thumbnail']
          : '',
    );
  }
}
