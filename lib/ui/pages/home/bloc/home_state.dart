part of 'home_bloc.dart';

@immutable
class HomeState extends Equatable {
  final HomeStatus status;
  final List<Character> characters;
  final int offset;
  final String errorMessage;

  const HomeState({
    this.status = HomeStatus.initial,
    this.characters = const [],
    this.offset = 0,
    this.errorMessage = '',
  });

  @override
  List<Object> get props => [status, characters, errorMessage];

  HomeState copyWith({
    HomeStatus? status,
    List<Character>? characters,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      characters: characters ?? this.characters,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

enum HomeStatus { initial, loading, success, failure, empty }

extension HomeStatusX on HomeStatus {
  T when<T>({
    required T Function() initial,
    required T Function() loading,
    required T Function() success,
    required T Function() failure,
    required T Function() empty,
  }) {
    switch (this) {
      case HomeStatus.initial:
        return initial();
      case HomeStatus.loading:
        return loading();
      case HomeStatus.success:
        return success();
      case HomeStatus.failure:
        return failure();
      case HomeStatus.empty:
        return empty();
    }
  }
}
