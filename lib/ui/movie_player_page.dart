import 'package:flutter/material.dart';


class MoviePlayerPage extends StatefulWidget {
  final int tmdbId;
  const MoviePlayerPage({super.key, required this.tmdbId});

  @override
  State<MoviePlayerPage> createState() => _MoviePlayerPageState();
}

class _MoviePlayerPageState extends State<MoviePlayerPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assistir Filme'),
        backgroundColor: Colors.black,
      ),
    );
  }
}
