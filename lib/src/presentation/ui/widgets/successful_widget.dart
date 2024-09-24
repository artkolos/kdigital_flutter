import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kdigital_test/src/domain/bloc/main_bloc.dart';
import 'package:kdigital_test/src/domain/bloc/main_event.dart';
import 'package:kdigital_test/src/domain/models/character.dart';
import 'package:kdigital_test/src/presentation/ui/widgets/characters_widget.dart';

class SuccessfulWidget extends StatefulWidget {
  const SuccessfulWidget({
    super.key,
    required this.characters,
  });

  final List<Character> characters;

  @override
  State<SuccessfulWidget> createState() => _SuccessfulWidgetState();
}

class _SuccessfulWidgetState extends State<SuccessfulWidget> {
  int _page = 1;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.characters.length,
      itemBuilder: (context, index) {
        if (index == widget.characters.length - 2) {
          _page++;
          context.read<MainPageBloc>().add(
                GetTestDataOnMainPageEvent(_page),
              );
        }
        return CharactersWidget(
          character: widget.characters[index],
        );
      },
    );
  }
}
