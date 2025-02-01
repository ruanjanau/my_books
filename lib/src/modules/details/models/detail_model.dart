import 'package:intl/intl.dart';

import '../../modules.dart';

class DetailModel {
  final String? id;
  final String? title;
  final String? publishedDate;
  final int? pageCount;
  final double? rating;
  final List<String>? author;
  final String? thumbnail;
  final double? price;
  final String? description;
  final List<String>? categories;
  final DimensionsModel? dimensions;
  final String? webReaderLink;

  const DetailModel({
    this.id,
    this.title,
    this.author,
    this.pageCount,
    this.rating,
    this.publishedDate,
    this.thumbnail,
    this.price,
    this.description,
    this.categories,
    this.dimensions,
    this.webReaderLink,
  });

  factory DetailModel.fromJson(Map<String, dynamic> json) {
    final authors = json['volumeInfo']['authors'];
    final imageLinks = json['volumeInfo']['imageLinks'];

    return DetailModel(
      id: json['id'] ?? '',
      title: json['volumeInfo']['title'] ?? '',
      publishedDate: DateFormat('dd/MM/yyyy').format(
        DateTime.parse(json['volumeInfo']['publishedDate'] ?? ''),
      ),
      pageCount: json['volumeInfo']['pageCount'] ?? 0,
      rating: json['volumeInfo']['averageRating'] is double
          ? json['volumeInfo']['averageRating']
          : json['volumeInfo']['averageRating'] is int
              ? json['volumeInfo']['averageRating'].toDouble()
              : 0.0,
      author: authors != null ? List<String>.from(authors) : ['unknown Author'],
      thumbnail: imageLinks != null && imageLinks['medium'] != null
          ? imageLinks['medium']
          : '',
      price: json['saleInfo']['listPrice']['amount'] ?? 0.0,
      description: json['volumeInfo']['description'] ?? '',
      categories: json['volumeInfo']['categories'] != null
          ? List<String>.from(json['volumeInfo']['categories'])
          : ['unknown Category'],
      dimensions:
          DimensionsModel.fromJson(json['volumeInfo']['dimensions'] ?? {}),
      webReaderLink: json['accessInfo']['webReaderLink'] ?? '',
    );
  }
}
