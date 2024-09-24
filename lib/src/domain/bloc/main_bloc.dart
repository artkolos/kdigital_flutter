import 'package:kdigital_test/src/domain/bloc/main_event.dart';
import 'package:kdigital_test/src/domain/bloc/main_state.dart';
import 'package:kdigital_test/src/domain/models/character.dart';
import 'package:kdigital_test/src/domain/repository/characters_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  final CharactersRepository _charactersRepository;

  final List<Character> _characters = List.empty(growable: true);

  MainPageBloc(
    MainPageState initialState,
    this._charactersRepository,
  ) : super(initialState) {
    on<GetTestDataOnMainPageEvent>(
      (event, emitter) => _getDataOnMainPageCasino(event, emitter),
    );
    on<DataLoadedOnMainPageEvent>(
      (event, emitter) => _dataLoadedOnMainPageCasino(event, emitter),
    );
  }

  Future<void> _dataLoadedOnMainPageCasino(
    DataLoadedOnMainPageEvent event,
    Emitter<MainPageState> emit,
  ) async {
    if (event.characters != null) {
      _characters.addAll(event.characters!);
      emit(SuccessfulMainPageState([..._characters], false));
    } else {
      emit(UnSuccessfulMainPageState());
    }
  }

  Future<void> _getDataOnMainPageCasino(
    GetTestDataOnMainPageEvent event,
    Emitter<MainPageState> emit,
  ) async {
    emit(SuccessfulMainPageState([..._characters], true));
    _charactersRepository.getCharacters(event.page).then(
      (value) {
        add(DataLoadedOnMainPageEvent(value));
      },
    );
  }
}
