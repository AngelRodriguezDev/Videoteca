import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return Container(
      color: Colors.amber,
      width: 150,
      height: 260,
      child: Column(
        children: [
          const Placeholder(
            fallbackHeight: 160,
            color: Colors.red,
          ),
          Text(
            "nombre de la pelicula",
            style: _theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
