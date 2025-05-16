import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:moviesapp/models/movie_response.dart';
import 'package:http/http.dart' as http;
import 'package:moviesapp/utils/api_constants.dart';

class MovieService {
  final apiKey = dotenv.env['API_KEY'];

  Future<MovieResponse> getPopularMovies({int page = 1}) async {
    final url = Uri.parse(
      '${ApiConstants.BASE_URL}popular?api_key=$apiKey&language=pt-BR&page=$page',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);

      return MovieResponse.fromMap(data);
    } else {
      throw Exception('Erro ao carregar filmes populares');
    }
  }
}
