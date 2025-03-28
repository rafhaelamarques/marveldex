import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marveldex/data/model/character.dart';
import 'package:marveldex/data/services/client/characters_client_local.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CharactersClientLocal characterClient;

  HomeBloc({required this.characterClient}) : super(const HomeState()) {
    on<HomeFetchCharactersEvent>((event, emit) async {
      await _fetchCharacters(emit);
    });
    on<HomeFetchMoreCharactersEvent>((event, emit) async {
      await _fetchCharacters(emit, offset: state.offset + 20);
    });
  }

  Future<void> _fetchCharacters(
    Emitter<HomeState> emit, {
    int offset = 0,
  }) async {
    offset == 0
        ? emit(state.copyWith(status: HomeStatus.loading))
        : emit(state.copyWith(status: HomeStatus.fetchingMore));

    try {
      final characters = await characterClient.getCharacters(offset: offset);
      emit(state.copyWith(status: HomeStatus.success, characters: characters));
    } catch (e) {
      emit(
        state.copyWith(status: HomeStatus.failure, errorMessage: e.toString()),
      );
    }
  }
}
