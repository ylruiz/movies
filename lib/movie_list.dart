import 'package:flutter/material.dart';

import 'http.helper.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  HttpHelper helper;
  int moviesCount;
  List movies;
  final String iconBase = 'https://image.tmdb.org/t/p/w92/';
  final String defaultImage =
      'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';

  @override
  void initState() {
    helper = HttpHelper();
    initialize();
    super.initState();
  }

  Future initialize() async {
    movies = [];
    movies = await helper.getUpcoming();
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }

  @override
  Widget build(BuildContext context) {
    NetworkImage image;

    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
      ),
      body: ListView.builder(
        itemCount: (this.moviesCount == null) ? 0 : this.moviesCount,
        itemBuilder: (BuildContext context, int position) {
          image = (movies[position].posterPath != null)
              ? NetworkImage(iconBase + movies[position].posterPath)
              : NetworkImage(defaultImage);

          return Card(
            color: Colors.white,
            elevation: 2,
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: image,
              ),
              title: Text(movies[position].title),
              subtitle: Text(
                  'Released: ${movies[position].releaseDate} - Vote: ${movies[position].voteAverage.toString()}'),
            ),
          );
        },
      ),
    );
  }
}
