import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marveldex/data/model/character.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc() : super(DetailsState()) {
    on<DetailsInitialEvent>((event, emit) {
      emit(
        state.copyWith(
          status: DetailsStatus.success,
          character: event.character,
        ),
      );
    });
  }
}
