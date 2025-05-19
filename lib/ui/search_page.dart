import 'package:flutter/material.dart';
import 'package:moviesapp/components/item_movie.dart';
import 'package:moviesapp/models/movie.dart';
import 'package:moviesapp/models/movie_response.dart';
import 'package:moviesapp/service/movie_service.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();
  final MovieService _movieService = MovieService();
  List<Movie> _movies = [];
  bool _isLoading = false;
  String _error = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _search(String query) async {
    if (query.trim().isEmpty) return;

    setState(() {
      _isLoading = true;
      _error = '';
      _movies = [];
    });

    try {
      final MovieResponse response = await _movieService.searchMovies(query);
      setState(() {
        _movies = response.results;
      });
    } catch (e) {
      setState(() {
        _error = 'Erro ao buscar filmes';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Widget _buildMovieItem(Movie movie) {
    final imageUrl = 'https://image.tmdb.org/t/p/w500${movie.posterPath}';

    return ListTile(
      leading: Image.network(imageUrl, width: 50, fit: BoxFit.cover),
      title: Text(movie.title, style: Theme.of(context).textTheme.titleLarge,),
      subtitle: Text(movie.originalTitle, style: Theme.of(context).textTheme.titleSmall?.copyWith(
        color: Colors.grey
      ),),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (_) => Scaffold(
                  appBar: AppBar(title: Text(movie.title)),
                  body: ItemMovie(
                    tmdbId: movie.id,
                    imageUrl: imageUrl,
                    title: movie.title,
                    subtitle: movie.originalTitle,
                    rating: movie.voteAverage,
                    synopsis: movie.overview,
                  ),
                ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Buscar filmes')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              onSubmitted: _search,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                focusedBorder:
                    Theme.of(context).inputDecorationTheme.focusedBorder,
                enabledBorder:
                    Theme.of(context).inputDecorationTheme.enabledBorder,
                filled: Theme.of(context).inputDecorationTheme.filled,
                fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                hintText: 'Digite o nome do filme',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => _search(_controller.text),
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            if (_isLoading)
              Center(child: CircularProgressIndicator())
            else if (_error.isNotEmpty)
              Center(child: Text(_error))
            else if (_movies.isEmpty)
              Center(
                child: Text(
                  'Nenhum resultado',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              )
            else
              Expanded(
                child: ListView.separated(
                  itemCount: _movies.length,
                  separatorBuilder: (_, __) => Divider(),
                  itemBuilder: (context, index) {
                    return _buildMovieItem(_movies[index]);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
