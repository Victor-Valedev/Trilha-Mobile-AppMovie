import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/components/grid_movies.dart';
import 'package:moviesapp/components/item_movie.dart';
import 'package:moviesapp/models/movie.dart';
import 'package:moviesapp/models/movie_response.dart';
import 'package:moviesapp/service/movie_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Movie> movies = [];
  final MovieService _movieService = MovieService();
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  bool _isLoadingMore = false;
  int _currentPage = 1;

  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });
    fetchMovies();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        fetchMoreMovies();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> fetchMoreMovies() async {
    if (_isLoadingMore) return;

    setState(() {
      _isLoadingMore = true;
      _currentPage++;
    });

    final MovieResponse response = await _movieService.getPopularMovies(
      page: _currentPage,
    );

    setState(() {
      movies.addAll(response.results);
      _isLoading = false;
      _isLoadingMore = false;
    });
  }

  Future<void> fetchMovies() async {
    final MovieResponse response = await _movieService.getPopularMovies();
    setState(() {
      _isLoading = false;
      movies.addAll(response.results);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Seja bem-vindo!')),
      body:
          _isLoading
              ? Center(child: CircularProgressIndicator(color: Colors.black))
              : ListView(
                controller: _scrollController,
                padding: const EdgeInsets.all(12),
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Color(0xFFE50914).withValues(alpha: 0.7),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Filmes em lançamentos',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      SizedBox(width: 15),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Color(0xFFE50914).withValues(alpha: 0.7),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Séries',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      SizedBox(width: 15),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Color(0xFFE50914).withValues(alpha: 0.7),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'TV',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 200,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 0.8,
                      aspectRatio: 16 / 9,
                    ),
                    items:
                        movies.map((movie) {
                          final imageUrl =
                              'https://image.tmdb.org/t/p/w500${movie.posterPath}';
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (_) => Scaffold(
                                        appBar: AppBar(
                                          title: Text(movie.title),
                                        ),
                                        body: ItemMovie(
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
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(color: Colors.grey),
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: Image.network(
                                      imageUrl,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    top: 10,
                                    left: 10,
                                    right: 10,
                                    child: Text(
                                      movie.title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(color: Colors.white),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Filmes populares',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 10),
                  Column(
                    children: [
                      GridMovies(movies: movies),
                      if (_isLoadingMore)
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
    );
  }
}
