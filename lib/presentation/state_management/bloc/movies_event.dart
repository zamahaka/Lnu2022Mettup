import 'package:equatable/equatable.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();
}

class LoadMovies extends MoviesEvent {
  @override
  List<Object?> get props => [];

  const LoadMovies();
}

class SimMoviesError extends MoviesEvent {
  @override
  List<Object?> get props => [];

  const SimMoviesError();
}
