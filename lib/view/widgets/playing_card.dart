import 'package:flutter/material.dart';
import 'package:videoteca/model/movie_model.dart';
import 'package:videoteca/view/widgets/image_movie.dart';
import 'package:videoteca/view/widgets/tag.dart';

class PlayingCard extends StatelessWidget {
  final Movie movie;
  const PlayingCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(
        right: 24,
        bottom: 24,
      ),
      child: SizedBox(
        height: 150,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                ImageMovie(
                  imgMovie: movie.image,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.white,
                          size: 12,
                        ),
                        Text(
                          movie.score.toString(),
                          style: _theme.textTheme.bodySmall,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        movie.name,
                        style: _theme.textTheme.bodyLarge,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text(
                        "${movie.duration} | ${movie.tags}",
                        style: _theme.textTheme.bodySmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TagMovie(tag: movie.release),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Icon(Icons.bookmark),
          ],
        ),
      ),
    );
  }
}
