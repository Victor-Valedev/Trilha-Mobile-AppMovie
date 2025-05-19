import 'package:flutter/material.dart';
import 'package:moviesapp/components/item_movie.dart';
import 'package:moviesapp/models/movie.dart';


class GridMovies extends StatelessWidget {
  final List<Movie> movies;

  const GridMovies({
    required this.movies,
    super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: movies.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        final movie = movies[index];
        final imageUrl = 'https://image.tmdb.org/t/p/w500${movie.posterPath}';
        return GestureDetector(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 6),
              Text(
                movie.title,
                style: Theme.of(context).textTheme.titleSmall,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      },
    );
  }
}
