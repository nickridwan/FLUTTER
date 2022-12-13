import 'package:flutter/material.dart';

class MovieItems extends StatelessWidget {
  final int id;
  final String imageUrl;
  final String title;

  MovieItems(
    this.id,
    this.imageUrl,
    this.title,
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: GridTile(
        child: Image.network(
          'http://image.tmdb.org/t/p/w154$imageUrl',
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.black87,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Icon(
                    Icons.error_outline_sharp,
                    color: Colors.red,
                    size: constraints.biggest.width,
                  );
                }),
            );
          },
        ),
      ),
    );
  }
}
