class Movie {
  final String? title;
  final String? year;
  final String? rated;
  final String? released;
  final String? runtime;
  final String? genre;
  final String? director;
  final String? writer;
  final String? actors;
  final String? plot;
  final String? language;
  final String? country;
  final String? awards;
  final String? poster;
  final List<Rating>? ratings;
  final String? metascore;
  final String? imdbRating;
  final String? imdbVotes;
  final String? imdbID;
  final String? type;
  final String? dvd;
  final String? boxOffice;
  final String? production;
  final String? website;
  final String? response;

  Movie({
    this.title,
    this.year,
    this.rated,
    this.released,
    this.runtime,
    this.genre,
    this.director,
    this.writer,
    this.actors,
    this.plot,
    this.language,
    this.country,
    this.awards,
    this.poster,
    this.ratings,
    this.metascore,
    this.imdbRating,
    this.imdbVotes,
    this.imdbID,
    this.type,
    this.dvd,
    this.boxOffice,
    this.production,
    this.website,
    this.response,
  });

  Movie.fromJson(Map<String, dynamic> json)
      : title = json['Title'],
        year = json['Year'],
        rated = json['Rated'],
        released = json['Released'],
        runtime = json['Runtime'],
        genre = json['Genre'],
        director = json['Director'],
        writer = json['Writer'],
        actors = json['Actors'],
        plot = json['Plot'],
        language = json['Language'],
        country = json['Country'],
        awards = json['Awards'],
        poster = json['Poster'],
        ratings =
            (json['Ratings'] as List?)?.map((e) => Rating.fromJson(e)).toList(),
        metascore = json['Metascore'],
        imdbRating = json['imdbRating'],
        imdbVotes = json['imdbVotes'],
        imdbID = json['imdbID'],
        type = json['Type'],
        dvd = json['DVD'],
        boxOffice = json['BoxOffice'],
        production = json['Production'],
        website = json['Website'],
        response = json['Response'];
}

class Rating {
  final String? source;
  final String? value;

  Rating({this.source, this.value});

  Rating.fromJson(Map<String, dynamic> json)
      : source = json['Source'],
        value = json['Value'];
}
