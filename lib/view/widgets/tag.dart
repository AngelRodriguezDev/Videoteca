import 'package:flutter/material.dart';

class TagMovie extends StatelessWidget {
  final String tag;
  const TagMovie({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(30),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.all(8),
      child: Text(tag, style: Theme.of(context).textTheme.bodySmall),
    );
  }
}
