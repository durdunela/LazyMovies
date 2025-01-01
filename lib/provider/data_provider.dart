import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inkino/api/config.dart';
import 'package:inkino/models/movie_model.dart';

final moviesDataProvider =
    FutureProvider.family<List<Movie>, String>((ref, searchTerm) async {
  return ref.watch(movieProvider).getMovies(searchTerm); // Dynamic search term
});
