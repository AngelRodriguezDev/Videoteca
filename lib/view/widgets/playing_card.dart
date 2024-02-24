import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:videoteca/view/widgets/image_movie.dart';
import 'package:videoteca/view/widgets/tag.dart';

class PlayingCard extends StatelessWidget {
  const PlayingCard({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(
        right: 24,
        bottom: 24,
      ),
      child: Container(
        //width: MediaQuery.of(context).size.width,
        height: 150,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                ImageMovie(
                  imgMovie:
                      "https://m.media-amazon.com/images/I/81y0foYjoFL._AC_UF894,1000_QL80_.jpg",
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
                          "9.2",
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
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "nombre dasdasde la pelicula",
                        style: _theme.textTheme.titleMedium,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text(
                        "2h 26min | action/adventure",
                        style: _theme.textTheme.bodySmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TagMovie(tag: "XXI"),
                        TagMovie(tag: "CVG"),
                        TagMovie(tag: "Cinemaxx"),
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
