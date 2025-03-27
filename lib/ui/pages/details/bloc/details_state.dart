part of 'details_bloc.dart';

@immutable
class DetailsState extends Equatable {
  final DetailsStatus status;
  final Character? character;
  const DetailsState({this.status = DetailsStatus.initial, this.character});

  @override
  List<Object> get props => [status, character ?? ''];

  DetailsState copyWith({DetailsStatus? status, Character? character}) {
    return DetailsState(
      status: status ?? this.status,
      character: character ?? this.character,
    );
  }
}

enum DetailsStatus { initial, loading, success, failure }

extension DetailsStatusX on DetailsStatus {
  T when<T>({
    required T Function() initial,
    required T Function() loading,
    required T Function() success,
    required T Function() failure,
  }) {
    switch (this) {
      case DetailsStatus.initial:
        return initial();
      case DetailsStatus.loading:
        return loading();
      case DetailsStatus.success:
        return success();
      case DetailsStatus.failure:
        return failure();
    }
  }
}
