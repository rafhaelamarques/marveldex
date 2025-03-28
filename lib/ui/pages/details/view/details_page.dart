import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marveldex/core/application.dart';
import 'package:marveldex/core/styles/app_styles.dart';
import 'package:marveldex/data/model/character.dart';
import 'package:marveldex/ui/pages/details/bloc/details_bloc.dart';
import 'package:marveldex/ui/pages/details/view/details_presentation.dart';

class DetailsPage extends StatelessWidget {
  final Character character;
  const DetailsPage({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.white,
      appBar: AppBar(
        title: Text(character.name, style: AppStyles.title),
        backgroundColor: AppStyles.lightRed,
        foregroundColor: AppStyles.white,
      ),
      body: BlocProvider(
        create:
            (context) =>
                getIt<DetailsBloc>()
                  ..add(DetailsInitialEvent(character: character)),
        child: BlocBuilder<DetailsBloc, DetailsState>(
          builder: (context, state) {
            return state.status.when(
              initial: () => const SizedBox(),
              loading: () => const Center(child: CircularProgressIndicator()),
              success: () => DetailsPresentation(character: state.character!),
              failure:
                  () => const Center(
                    child: Text('Erro ao carregar informações de personagem'),
                  ),
            );
          },
        ),
      ),
    );
  }
}
