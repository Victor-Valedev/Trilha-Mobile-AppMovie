import 'package:flutter/material.dart';
import 'package:moviesapp/ui/movie_player_page.dart';

class ItemMovie extends StatelessWidget {
  final int tmdbId;
  final String imageUrl;
  final String title;
  final String subtitle;
  final double rating;
  final String synopsis;

  const ItemMovie({
    Key? key,
    required this.tmdbId,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.synopsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.network(
            imageUrl,
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            subtitle,
                            style: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(color: Colors.grey),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 20,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                rating.toStringAsFixed(1),
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => MoviePlayerPage(tmdbId: tmdbId),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[700],
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                      child: const Text(
                        'Assistir',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text('Sinopse:', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                Text(
                  synopsis,
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
