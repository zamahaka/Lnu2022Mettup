import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final String title;
  final String coverUrl;

  @override
  List<Object?> get props => [title, coverUrl];

  const Movie({
    required this.title,
    required this.coverUrl,
  });
}
