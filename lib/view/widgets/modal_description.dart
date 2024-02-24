import 'package:flutter/material.dart';
import 'package:videoteca/model/movie_model.dart';

class ModalDescription extends StatelessWidget {
  final Movie movie;
  const ModalDescription({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return AlertDialog(
      title: Center(child: Text(movie.name)),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Image.network(
                movie.image,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              "${movie.duration} | ${movie.tags}",
              style: _theme.textTheme.bodySmall,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
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
                ),
              ],
            ),
            Text(movie.description),
            MaterialButton(
              shape: StadiumBorder(),
              color: Colors.orange,
              child: Text("cerrar"),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
    );
  }
}
