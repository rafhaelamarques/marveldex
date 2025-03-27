import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marveldex/core/application.dart';
import 'package:marveldex/core/styles/app_styles.dart';
import 'package:marveldex/data/model/character.dart';
import 'package:marveldex/ui/pages/home/bloc/home_bloc.dart';
import 'package:marveldex/ui/pages/home/components/character_horizontal_card.dart';
import 'package:marveldex/ui/pages/home/components/character_vertical_card.dart';
import 'package:marveldex/ui/widgets/horizontal_card_shimmer.dart';
import 'package:marveldex/ui/widgets/vertical_card_shimmer.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.white,
      body: BlocProvider(
        create: (context) => getIt<HomeBloc>()..add(HomeFetchCharactersEvent()),
        child: SafeArea(child: HomePresentation()),
      ),
    );
  }
}

class HomePresentation extends StatefulWidget {
  const HomePresentation({super.key});

  @override
  State<HomePresentation> createState() => _HomePresentationState();
}

class _HomePresentationState extends State<HomePresentation> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  /// Identifica quando o usuário chegou ao final da lista
  /// e aciona o evento de carregar mais personagens
  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 100) {
      context.read<HomeBloc>().add(HomeFetchMoreCharactersEvent());
    }
  }

  /// Carrossel de personagens na parte superior da tela
  List<Widget> _generateTopWidgets(List<Character> characters) {
    return characters
        .map(
          (character) =>
              CharacterVerticalCard(character: character, onTap: () {}),
        )
        .toList();
  }

  /// Lista de personagens na parte inferior da tela
  List<Widget> _generateBottomWidgets(List<Character> characters) {
    return characters
        .map(
          (character) =>
              CharacterHorizontalCard(character: character, onTap: () {}),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return state.status.when(
          initial: () => const Center(child: SizedBox()),
          loading:
              () => Shimmer.fromColors(
                baseColor: AppStyles.shimmerBaseColor,
                highlightColor: AppStyles.shimmerHighlightColor,
                child: ListView(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        color: AppStyles.grey.withAlpha(100),
                        child: Row(
                          spacing: 8,
                          children: List.generate(
                            5,
                            (index) => const VerticalCardShimmer(),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: List.generate(
                        10,
                        (index) => const HorizontalCardShimmer(),
                      ),
                    ),
                  ],
                ),
              ),
          success: () {
            final characters = state.characters;
            return ListView(
              controller: _scrollController,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [AppStyles.black, AppStyles.lightRed],
                      ),
                    ),
                    child: Row(
                      spacing: 8,
                      children: _generateTopWidgets(
                        characters.take(5).toList(),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: _generateBottomWidgets(characters.sublist(5)),
                  ),
                ),
              ],
            );
          },
          failure:
              () =>
                  const Center(child: Text('Erro ao carregar os personagens')),
          empty:
              () => const Center(child: Text('Nenhum personagem encontrado')),
        );
      },
    );
  }
}
