import 'package:flutter/material.dart';
import 'package:inkino/api/config.dart';
import 'package:inkino/models/movie_model.dart';

class MovieDetailScreen extends StatelessWidget {
  final String imdbID;

  const MovieDetailScreen({super.key, required this.imdbID});

  @override
  Widget build(BuildContext context) {
    final apiService = ApiServices();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Details'),
        backgroundColor: const Color(0xffEA526F),
      ),
      body: FutureBuilder<Movie>(
        future: apiService.getMovieDetails(imdbID),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.hasData) {
            final movie = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (movie.poster != null)
                    Center(
                      child: Image.network(
                        movie.poster!,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                  const SizedBox(height: 16),
                  Text(
                    movie.title!,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Release Year: ${movie.year}',
                    style: const TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  Text(
                    'Actors: ${movie.actors}',
                    style: const TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  if (movie.plot != null)
                    Text(
                      movie.plot!,
                      style: const TextStyle(fontSize: 16),
                    ),
                  const SizedBox(height: 16),
                  Text(
                    'imdbRating: ${movie.imdbRating!}',
                    style: const TextStyle(fontSize: 18, color: Colors.grey),
                  )
                ],
              ),
            );
          } else {
            return const Center(child: Text('No details found'));
          }
        },
      ),
    );
  }
}
