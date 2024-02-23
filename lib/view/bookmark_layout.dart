import 'package:flutter/material.dart';
import 'package:videoteca/view/widgets/movie_card.dart';

class BookMarkPage extends StatefulWidget {
  const BookMarkPage({super.key});

  @override
  State<BookMarkPage> createState() => _BookMarkPageState();
}

class _BookMarkPageState extends State<BookMarkPage> {
  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Bookmark", style: _theme.textTheme.titleLarge),
        ),
        backgroundColor: _theme.appBarTheme.backgroundColor,
        bottom: PreferredSize(
          preferredSize: const Size(0, 50),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
            ),
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
                  //labelText: "Search movie in your city...",
                  label: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Search movie in your city..."),
                      Icon(Icons.search),
                    ],
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          color: _theme.colorScheme.background,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Flex(
            direction: Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "TRENDING",
                      style: _theme.textTheme.titleMedium,
                    ),
                    Row(
                      children: [
                        MovieCard(),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  "NOW PLAYING",
                  style: _theme.textTheme.titleMedium,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: Colors.grey,
            ),
            label: ""),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark_border_outlined,
              color: Colors.grey,
            ),
            label: ""),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.confirmation_num_outlined,
              color: Colors.grey,
            ),
            label: ""),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.run_circle,
              color: Colors.grey,
            ),
            label: ""),
      ]),
    );
  }
}
