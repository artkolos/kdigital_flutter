import 'package:flutter/material.dart';
import 'package:kdigital_test/src/presentation/ui/widgets/characters_widget.dart';

import '../../../domain/bloc/main_state.dart';

class SuccessfulWidget extends StatelessWidget {
  const SuccessfulWidget({
    super.key,
    required this.state,
  });

  final SuccessfulMainPageState state;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      cacheExtent: double.infinity,
      itemCount: state.characters.length,
      itemBuilder: (context, index) => CharactersWidget(
        character: state.characters[index],
      ),
    );
  }
}
