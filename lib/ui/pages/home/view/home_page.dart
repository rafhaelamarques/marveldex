import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marveldex/core/application.dart';
import 'package:marveldex/core/styles/app_styles.dart';
import 'package:marveldex/ui/pages/home/bloc/home_bloc.dart';
import 'package:marveldex/ui/pages/home/view/home_presentation.dart';
import 'package:marveldex/ui/pages/home/view/home_shimmer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(10),
        child: AppBar(backgroundColor: AppStyles.lightRed),
      ),
      body: BlocProvider(
        create: (context) => getIt<HomeBloc>()..add(HomeFetchCharactersEvent()),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return state.status.when(
              initial: () => const Center(child: SizedBox()),
              loading: () => HomeShimmer(),
              fetchingMore:
                  () => HomePresentation(characters: state.characters),
              success: () => HomePresentation(characters: state.characters),
              failure: () => Center(child: Text(state.errorMessage)),
              empty: () => Center(child: Text(state.errorMessage)),
            );
          },
        ),
      ),
    );
  }
}
