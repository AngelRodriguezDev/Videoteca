import 'package:flutter/material.dart';
import 'package:videoteca/model/movie_model.dart';
import 'package:videoteca/view/widgets/image_movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return SizedBox(
      width: 130,
      height: 275,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: ImageMovie(
              imgMovie: movie.image,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              movie.name,
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
                  movie.score.toString(),
                  style: _theme.textTheme.bodySmall,
                )
              ],
            ),
          ),
          Text(
            "${movie.duration} | ${movie.tags}",
            style: _theme.textTheme.bodySmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
