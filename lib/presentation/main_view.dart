import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inkino/models/movie_model.dart';
import 'package:inkino/presentation/details_view.dart';
import 'package:inkino/provider/data_provider.dart';

class MainView extends ConsumerStatefulWidget {
  const MainView({super.key});

  @override
  ConsumerState<MainView> createState() => _MainViewState();
}

class _MainViewState extends ConsumerState<MainView> {
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final movieData = ref.watch(moviesDataProvider(
        searchController.text.isEmpty ? 'Avengers' : searchController.text));

    return Scaffold(
      backgroundColor: const Color(0xffF7F7FF),
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: isSearching
            ? TextField(
                controller: searchController,
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.white),
                ),
                style: const TextStyle(color: Colors.black),
                onChanged: (query) {
                  setState(() {});
                },
              )
            : const Text('LazyMovies'),
        actions: [
          isSearching
              ? IconButton(
                  icon: const Icon(Icons.clear, color: Colors.black),
                  onPressed: () {
                    setState(() {
                      searchController.clear();
                      isSearching = false;
                    });
                  },
                )
              : IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 25,
                  ),
                  onPressed: () {
                    setState(() {
                      isSearching = true;
                    });
                  },
                ),
        ],
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xff070600),
          fontSize: 20,
        ),
        backgroundColor: const Color(0xffEA526F),
      ),
      body: Column(
        children: [
          movieData.when(
            data: (movieData) {
              List<Movie> movieList = movieData;

              return Expanded(
                child: ListView.builder(
                  itemCount: movieList.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      child: Card(
                        color: Colors.transparent,
                        elevation: 0,
                        child: ListTile(
                          leading: movieList[index].poster != null
                              ? Image.network(
                                  movieList[index].poster!,
                                  width: 50,
                                  height: 100,
                                  fit: BoxFit.cover,
                                )
                              : const Icon(
                                  Icons.image_not_supported,
                                  color: Color(0xffEA526F),
                                ),
                          title: Text(
                            '${movieList[index].title}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            '${movieList[index].year}',
                            style: const TextStyle(
                                color: Color(0xffEA526F),
                                fontWeight: FontWeight.w400),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MovieDetailScreen(
                                    imdbID: movieList[index].imdbID!),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              );
            },
            error: (error, s) => Center(child: Text(error.toString())),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
