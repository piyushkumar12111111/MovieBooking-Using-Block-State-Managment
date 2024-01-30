import 'package:book_my_movie/features/book_movies_ticket/data/models/upcoming_movies_model/upcoming_movies_model.dart';
import 'package:book_my_movie/features/book_movies_ticket/domain/repositories/movies_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'book_movies_ticket_state.dart';

class BookMoviesTicketCubit extends Cubit<BookMoviesTicketState> {
  BookMoviesTicketCubit({required this.repository})
      : super(BookMoviesTicketInitial()) {
    getUpcomingMovie();
  }

  final MoviesRepository repository;

  int? _totalMoviesCount;
  int? get totalMoviesCount => _totalMoviesCount;

  void getUpcomingMovie() async {
    emit(BookMoviesLoading());
    final _result = await repository.getUpcomingMovies();
    if (_result.data != null) {
      _totalMoviesCount = _result.data?.results?.length;
      emit(UpcomingMoviesLoaded(_result.data));
    } else {
      emit(BookMoviesError(_result.error?.message ?? ''));
    }
  }
}
