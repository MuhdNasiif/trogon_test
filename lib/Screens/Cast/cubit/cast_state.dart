part of 'cast_cubit.dart';

@immutable
sealed class CastState {}

final class CastInitial extends CastState {}

class ViewAllCastData extends CastState{
   final List<Castmodel> models;
  ViewAllCastData({required this.models,});
}