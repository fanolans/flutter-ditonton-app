import 'package:equatable/equatable.dart';
import 'package:tv_series/domain/entities/tv_series/tvseries.dart';

class TvSeriesModel extends Equatable {
  const TvSeriesModel({
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.firstAirDate,
    required this.name,
    required this.voteAverage,
    required this.voteCount,
  });
  final String? backdropPath;
  final List<int> genreIds;
  final int id;
  final String? originalName;
  final String? overview;
  final double popularity;
  final String? posterPath;
  final String? firstAirDate;
  final String? name;
  final double voteAverage;
  final int voteCount;

  factory TvSeriesModel.fromJson(Map<String, dynamic> json) => TvSeriesModel(
    backdropPath: json["backdrop_path"],
    genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
    id: json["id"],
    originalName: json["original_name"],
    overview: json["overview"],
    popularity: json["popularity"].toDouble(),
    posterPath: json["poster_path"],
    firstAirDate: json["first_air_date"],
    name: json["name"],
    voteAverage: json["vote_average"].toDouble(),
    voteCount: json["vote_count"],
  );
  Map<String, dynamic> toJson() => {
    "backdrop_path": backdropPath,
    "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
    "id": id,
    "original_name": originalName,
    "overview": overview,
    "popularity": popularity,
    "poster_path": posterPath,
    "first_air_date": firstAirDate,
    "name": name,
    "vote_average": voteAverage,
    "vote_count": voteCount,
  };
  TvSeries toEntity() {
    return TvSeries(
      backdropPath: backdropPath,
      genreIds: genreIds,
      id: id,
      originalName: originalName,
      overview: overview,
      popularity: popularity,
      posterPath: posterPath,
      firstAirDate: firstAirDate,
      name: name,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }
  @override
  List<Object?> get props => [
    backdropPath,
    genreIds,
    id,
    originalName,
    overview,
    popularity,
    posterPath,
    firstAirDate,
    name,
    voteAverage,
    voteCount,
  ];
}