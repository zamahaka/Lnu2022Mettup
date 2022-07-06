import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lnu2022mettup/presentation/state_management/data/movie.dart';

import 'bloc/bloc.dart';

class StateManagementPage extends StatelessWidget {
  const StateManagementPage({super.key}) : super();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesBloc()..add(const LoadMovies()),
      child: Scaffold(
        appBar: AppBar(title: const Text("State Management")),
        backgroundColor: Colors.white,
        body: BlocBuilder<MoviesBloc, MoviesState>(
          builder: (context, state) {
            if (state is MoviesLoading) return const LoadingBody();
            if (state is MoviesError) return ErrorBody(error: state.error);
            if (state is MoviesLoaded) return LoadedBody(movies: state.movies);

            return Container();
          },
        ),
        floatingActionButton: const SimErrorFab(),
      ),
    );
  }
}

class LoadedBody extends StatelessWidget {
  final List<Movie> movies;

  const LoadedBody({
    super.key,
    required this.movies,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      padding: const EdgeInsets.all(4),
      itemCount: movies.length,
      itemBuilder: (context, index) => MovieGridTile(
        movie: movies[index],
      ),
    );
  }
}

class ErrorBody extends StatelessWidget {
  final String error;

  const ErrorBody({super.key, required this.error}) : super();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Image(
          image: AssetImage("assets/images/movies_error.webp"),
        ),
        Text(error),
        const SizedBox(height: 16),
        OutlinedButton(
          onPressed: () => BlocProvider.of<MoviesBloc>(context).add(
            const LoadMovies(),
          ),
          child: const Text("Lets try again"),
        ),
      ],
    );
  }
}

class LoadingBody extends StatelessWidget {
  const LoadingBody({super.key}) : super();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class SimErrorFab extends StatelessWidget {
  const SimErrorFab({super.key}) : super();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        if (state is MoviesLoaded) {
          return FloatingActionButton(
            child: const Icon(Icons.error_outline_rounded),
            onPressed: () => BlocProvider.of<MoviesBloc>(context).add(
              const SimMoviesError(),
            ),
          );
        }

        return Container();
      },
    );
  }
}

class MovieGridTile extends StatelessWidget {
  final Movie movie;

  const MovieGridTile({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          title: Text(movie.title),
        ),
        child: Image.network(
          movie.coverUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
