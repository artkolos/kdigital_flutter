import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kdigital_test/src/domain/bloc/main_bloc.dart';
import 'package:kdigital_test/src/domain/bloc/main_event.dart';
import 'package:kdigital_test/src/domain/bloc/main_state.dart';
import 'package:kdigital_test/src/domain/repository/characters_repository.dart';
import 'package:kdigital_test/src/presentation/ui/widgets/loading_widget.dart';
import 'package:kdigital_test/src/presentation/ui/widgets/successful_widget.dart';

@immutable
class CharactersScreen extends StatelessWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => MainPageBloc(
          InitialMainPageState(),
          GetIt.I.get<CharactersRepository>(),
        )..add(const GetTestDataOnMainPageEvent(1)),
        child: BlocBuilder<MainPageBloc, MainPageState>(
          builder: (blocContext, state) {
            if (state is SuccessfulMainPageState) {
              return Stack(
                children: [
                  if (state.isLoading) const LoadingWidget(),
                  SuccessfulWidget(
                    characters: state.characters,
                  ),
                ],
              );
            } else {
              return const Center(
                child: Text("error"),
              );
            }
          },
        ),
      ),
    );
  }
}
