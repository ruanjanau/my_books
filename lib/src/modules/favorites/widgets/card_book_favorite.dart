import 'package:flutter/material.dart';

class CardBookFavorite extends StatelessWidget {
  final String title;
  final String author;
  final String image;
  final VoidCallback? onTap;
  const CardBookFavorite({
    super.key,
    this.onTap,
    required this.title,
    required this.author,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.26,
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 4), // changes position of shadow
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Image.network(
                image,
                height: MediaQuery.of(context).size.height * 0.18,
                width: double.infinity,
                fit: BoxFit.fitHeight,
              ),
              const Divider(thickness: 1, color: Colors.grey),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                author,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
