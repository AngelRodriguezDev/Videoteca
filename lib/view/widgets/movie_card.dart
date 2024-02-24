import 'package:flutter/material.dart';
import 'package:videoteca/view/widgets/image_movie.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return Container(
      width: 130,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: ImageMovie(
              imgMovie:
                  "https://m.media-amazon.com/images/I/81y0foYjoFL._AC_UF894,1000_QL80_.jpg",
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "nombre de la pelicula",
              style: _theme.textTheme.bodyMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 12,
                ),
                Text(
                  "9.2",
                  style: _theme.textTheme.bodySmall,
                )
              ],
            ),
          ),
          Text(
            "2h 26min | action/adventure",
            style: _theme.textTheme.bodySmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
