part of 'movies_cubit.dart';

@immutable
sealed class MoviesState {}

final class MoviesInitial extends MoviesState {}

class ViewAllData extends MoviesState{
  final List<Moviesmodel> model;
  ViewAllData({required this.model});
}