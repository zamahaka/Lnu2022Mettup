import 'package:equatable/equatable.dart';
import 'package:lnu2022mettup/presentation/state_management/data/movie.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();
}

class MoviesLoading extends MoviesState {
  @override
  List<Object?> get props => [];

  const MoviesLoading();
}

class MoviesError extends MoviesState {
  final String error;

  @override
  List<Object?> get props => [];

  const MoviesError({
    required this.error,
  });
}

class MoviesLoaded extends MoviesState {
  final List<Movie> movies;

  @override
  List<Object?> get props => [movies];

  const MoviesLoaded({required this.movies});
}
