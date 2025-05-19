import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:moviesapp/models/movie.dart';

class MovieResponse {
  final int page;
  final List<Movie> results;
  final int totalPages;
  final int totalResults;

  MovieResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  MovieResponse copyWith({
    int? page,
    List<Movie>? results,
    int? totalPages,
    int? totalResults,
  }) {
    return MovieResponse(
      page: page ?? this.page,
      results: results ?? this.results,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'results': results.map((x) => x.toMap()).toList(),
      'totalPages': totalPages,
      'totalResults': totalResults,
    };
  }

  factory MovieResponse.fromMap(Map<String, dynamic> map) {
    return MovieResponse(
      page: map['page']?.toInt() ?? 0,
      results: List<Movie>.from(map['results']?.map((x) => Movie.fromMap(x))),
      totalPages: map['total_pages']?.toInt() ?? 0,
      totalResults: map['total_results']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieResponse.fromJson(String source) => MovieResponse.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MovieResponse(page: $page, results: $results, totalPages: $totalPages, totalResults: $totalResults)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is MovieResponse &&
      other.page == page &&
      listEquals(other.results, results) &&
      other.totalPages == totalPages &&
      other.totalResults == totalResults;
  }

  @override
  int get hashCode {
    return page.hashCode ^
      results.hashCode ^
      totalPages.hashCode ^
      totalResults.hashCode;
  }
}
