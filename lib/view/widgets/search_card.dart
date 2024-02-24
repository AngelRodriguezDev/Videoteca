import 'package:flutter/material.dart';
import 'package:videoteca/model/movie_model.dart';
import 'package:videoteca/view/widgets/image_movie.dart';

class SearchCard extends StatelessWidget {
  final Movie movie;
  const SearchCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      width: 350,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                child: ImageMovie(
                  imgMovie: movie.image,
                ),
              ),
              SizedBox(
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                        mainAxisAlignment: MainAxisAlignment.center,
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
                    SizedBox(
                      width: double.maxFinite,
                      child: Text(
                        movie.description,
                        style: _theme.textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Divider(
            color: Colors.orange,
            height: 4,
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
