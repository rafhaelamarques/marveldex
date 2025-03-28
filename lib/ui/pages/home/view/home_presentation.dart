import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marveldex/core/styles/app_styles.dart';
import 'package:marveldex/data/model/character.dart';
import 'package:marveldex/ui/pages/details/view/details_page.dart';
import 'package:marveldex/ui/pages/home/bloc/home_bloc.dart';
import 'package:marveldex/ui/pages/home/components/character_horizontal_card.dart';
import 'package:marveldex/ui/pages/home/components/character_vertical_card.dart';

class HomePresentation extends StatefulWidget {
  final List<Character> characters;
  const HomePresentation({super.key, required this.characters});

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
          (character) => CharacterVerticalCard(
            character: character,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailsPage(character: character),
                ),
              );
            },
          ),
        )
        .toList();
  }

  /// Lista de personagens na parte inferior da tela
  List<Widget> _generateBottomWidgets(List<Character> characters) {
    return characters
        .map(
          (character) => CharacterHorizontalCard(
            character: character,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailsPage(character: character),
                ),
              );
            },
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
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
                  widget.characters.take(5).toList(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: _generateBottomWidgets(widget.characters.sublist(5)),
            ),
          ),
        ],
      ),
    );
  }
}
