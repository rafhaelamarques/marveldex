part of 'details_bloc.dart';

sealed class DetailsEvent extends Equatable {
  const DetailsEvent();

  @override
  List<Object> get props => [];
}

class DetailsInitialEvent extends DetailsEvent {
  final Character character;

  const DetailsInitialEvent({required this.character});

  @override
  List<Object> get props => [character];
}
