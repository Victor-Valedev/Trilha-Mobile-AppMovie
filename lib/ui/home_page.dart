import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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
  bool _isLoading = false;

  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });
    super.initState();
    fetchMovies();
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
              : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
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
                  ),
                  SizedBox(height: 15),
                  Container(
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 200,
                        autoPlay: false,
                        enlargeCenterPage: true,
                        viewportFraction: 0.8,
                        aspectRatio: 16 / 9,
                      ),
                      items:
                          movies.map((movie) {
                            final imageUrl =
                                'https://image.tmdb.org/t/p/w500${movie.posterPath}';
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  decoration: BoxDecoration(color: Colors.grey),
                                  child: Stack(
                                    children: [
                                      Positioned.fill(
                                        child: Image.network(
                                          imageUrl,
                                          fit: BoxFit.cover,
                                          loadingBuilder: (
                                            context,
                                            child,
                                            loadingProgress,
                                          ) {
                                            if (loadingProgress == null)
                                              return child;
                                            return Center(
                                              child: CircularProgressIndicator(
                                                value:
                                                    loadingProgress
                                                                .expectedTotalBytes !=
                                                            null
                                                        ? loadingProgress
                                                                .cumulativeBytesLoaded /
                                                            loadingProgress
                                                                .expectedTotalBytes!
                                                        : null,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      Positioned(
                                        top: 10,
                                        left: 10,
                                        child: Text(
                                          movie.title,
                                          style:
                                              Theme.of(
                                                context,
                                              ).textTheme.titleLarge,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          }).toList(),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Continue assistindo',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
    );
  }
}
