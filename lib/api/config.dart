import 'dart:convert';
import 'package:http/http.dart';
import 'package:inkino/models/movie_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApiServices {
  final String apiKey = '22015cd';
  final String baseUrl = 'https://www.omdbapi.com/?apikey=';

  Future<List<Movie>> getMovies(String searchTerm) async {
    try {
      final String url = '$baseUrl$apiKey&s=$searchTerm';
      Response response = await get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> result = jsonDecode(response.body);

        if (result['Response'] == 'True') {
          final List? movies = result['Search'];
          if (movies != null) {
            return movies.map((e) => Movie.fromJson(e)).toList();
          } else {
            throw Exception('No movies found');
          }
        } else {
          throw Exception('Error: ${result['Error']}');
        }
      } else {
        throw Exception('Failed to load data: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}

final movieProvider = Provider<ApiServices>((ref) => ApiServices());
