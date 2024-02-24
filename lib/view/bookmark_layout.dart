import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:videoteca/controller/bookmark_controller.dart';
import 'package:videoteca/model/movie_model.dart';
import 'package:videoteca/view/widgets/modal_description.dart';
import 'package:videoteca/view/widgets/movie_card.dart';
import 'package:videoteca/view/widgets/playing_card.dart';
import 'package:videoteca/view/widgets/search_card.dart';

class BookMarkPage extends StatefulWidget {
  const BookMarkPage({super.key});

  @override
  State<BookMarkPage> createState() => _BookMarkPageState();
}

class _BookMarkPageState extends State<BookMarkPage> {
  TextEditingController txtController = TextEditingController();
  @override
  void initState() {
    super.initState();
    context.read<BookmarkController>().setTrendingList();
    context.read<BookmarkController>().setNowPlayingList();
  }

  @override
  Widget build(BuildContext context) {
    List<Movie> _trendingList =
        context.watch<BookmarkController>().trendingList;
    List<Movie> _nowPlayingList =
        context.watch<BookmarkController>().nowPlayingList;
    ThemeData _theme = Theme.of(context);

    bool isSearching = context.watch<BookmarkController>().isSearching;

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
                controller: txtController,
                decoration: InputDecoration(
                  suffixIcon: isSearching
                      ? IconButton(
                          onPressed: () {
                            txtController.clear();
                            context.read<BookmarkController>().setSearch("");
                          },
                          icon: Icon(Icons.clear),
                        )
                      : Icon(Icons.search),
                  fillColor: Colors.white.withAlpha(30),
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  label: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Search movie in your city..."),
                    ],
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
                onChanged: (value) {
                  context.read<BookmarkController>().setSearch(value);
                },
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: context.watch<BookmarkController>().isSearching
            ? Padding(
                padding: const EdgeInsets.only(
                  left: 24.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        "SEARCHING",
                        style: _theme.textTheme.titleMedium,
                      ),
                    ),
                    Column(
                      children: [
                        for (int i = 0;
                            i <
                                context
                                    .watch<BookmarkController>()
                                    .searchList
                                    .length;
                            i++)
                          GestureDetector(
                            onTap: () => showDialog(
                              context: context,
                              builder: (context) => ModalDescription(
                                  movie: context
                                      .watch<BookmarkController>()
                                      .searchList
                                      .elementAt(i)),
                            ),
                            child: SearchCard(
                                movie: context
                                    .watch<BookmarkController>()
                                    .searchList
                                    .elementAt(i)),
                          ),
                      ],
                    ),
                  ],
                ),
              )
            : Container(
                color: _theme.colorScheme.background,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 24.0, top: 24, bottom: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              "TRENDING",
                              style: _theme.textTheme.titleMedium,
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                for (int i = 0; i < _trendingList.length; i++)
                                  Padding(
                                    padding: const EdgeInsets.only(right: 24.0),
                                    child: GestureDetector(
                                      onTap: () => showDialog(
                                        context: context,
                                        builder: (context) => ModalDescription(
                                            movie: _trendingList.elementAt(i)),
                                      ),
                                      child: MovieCard(
                                          movie: _trendingList.elementAt(i)),
                                    ),
                                  ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 24.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: Text(
                              "NOW PLAYING",
                              style: _theme.textTheme.titleMedium,
                            ),
                          ),
                          Column(
                            children: [
                              for (int i = 0; i < _nowPlayingList.length; i++)
                                GestureDetector(
                                    onTap: () => showDialog(
                                          context: context,
                                          builder: (context) =>
                                              ModalDescription(
                                                  movie: _nowPlayingList
                                                      .elementAt(i)),
                                        ),
                                    child: PlayingCard(
                                        movie: _nowPlayingList.elementAt(i))),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
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
        ],
      ),
    );
  }
}
