import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lnu2022mettup/presentation/state_management/data/movie.dart';

import 'movies_event.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(const MoviesLoading()) {
    on<LoadMovies>((event, emit) async {
      emit(const MoviesLoading());

      await Future.delayed(const Duration(seconds: 1));

      emit(const MoviesLoaded(movies: _demoMovies));
    });

    on<SimMoviesError>((event, emit) async {
      emit(const MoviesError(error: "Seems that movies got lost"));
    });
  }
}

const List<Movie> _demoMovies = [
  Movie(
    title: "Fantastic Beasts: The Secrets of Dumbledore",
    coverUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR05Pz4KhR1duYx2RsHeZBYkNlcA9_UDv50BCUcjVguu4loZZA0",
  ),
  Movie(
    title: "Spiderhead",
    coverUrl:
        "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSRj6APAJg_K37zyU_RcjW-9NWX7lBvW3aKevGHEl6YwVCqDfmU",
  ),
  Movie(
    title: "Interceptor",
    coverUrl:
        "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTxb7A9X-FoM6kcMiKTeoAa92cMutRrAvTqiQYUUGAFktPZbrLM",
  ),
  Movie(
    title: "Eternals",
    coverUrl:
        "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTZBNOF324-MHMcNrSD8mFRBD3eEfj5lfVT69NMC16cFxLH0iku",
  ),
  Movie(
    title: "Red Notice",
    coverUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXCDeWcTDLEWXq-hhpO5gUZh-rB0QNhSLvCRwUfPk1Vft1tBSH",
  ),
  Movie(
    title: "Don't Look Up",
    coverUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXfTeV7wQoKq7qI_2noWRFKfzFwGmxnmElmXnv0fpoO7u0KYSv",
  ),
  Movie(
    title: "Black Widow",
    coverUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSxnnpUHDu-N4JFDV1rTDX6gOoSFFYYAwaWZYi4oF5_sgq7afv",
  ),
  Movie(
    title: "Wrath of Man",
    coverUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdSihMONgITeMLq585q_sOWW45YFDf9S-hm-NfgCybECNaRrHT",
  ),
  Movie(
    title: "F9",
    coverUrl:
        "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcToIEC7dBudWOT6145GSxOU8i1LNWwTWiQBKct7ss7k413AbCvh",
  ),
  Movie(
    title: "Dune",
    coverUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvJznVehDbSUPihJbSTNwH8Tgnvh4ZDxs0J4hV06wOvHHidHul",
  ),
];
