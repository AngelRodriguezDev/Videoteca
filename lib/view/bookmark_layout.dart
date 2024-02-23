import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookMarkPage extends StatefulWidget {
  const BookMarkPage({super.key});

  @override
  State<BookMarkPage> createState() => _BookMarkPageState();
}

class _BookMarkPageState extends State<BookMarkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bookmark", style: Theme.of(context).textTheme.titleLarge),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        bottom: PreferredSize(
          preferredSize: const Size(0, 50),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: SizedBox(
              height: 40,
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white.withAlpha(30),
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        color: Theme.of(context).colorScheme.background,
        child: Column(
          children: [
            Flex(
              direction: Axis.vertical,
            )
            //Trending
            //Now Playing
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ""),
        BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border_outlined), label: ""),
        BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_num_outlined), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.run_circle), label: ""),
      ]),
    );
  }
}
