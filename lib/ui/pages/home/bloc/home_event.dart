part of 'home_bloc.dart';

@immutable
sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeFetchCharactersEvent extends HomeEvent {}

class HomeFetchMoreCharactersEvent extends HomeEvent {}
