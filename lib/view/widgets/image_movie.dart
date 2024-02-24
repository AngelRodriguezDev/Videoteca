import 'package:flutter/material.dart';

class ImageMovie extends StatelessWidget {
  final String imgMovie;
  const ImageMovie({super.key, required this.imgMovie});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 170,
          width: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: NetworkImage(
                imgMovie,
              ),
            ),
          ),
        ),
        Container(
          height: 170,
          width: 130,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black87],
                  stops: [0.6, 15],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter)),
        ),
      ],
    );
  }
}
