import 'package:equatable/equatable.dart';
import 'package:kdigital_test/src/domain/models/character.dart';

abstract class MainPageState extends Equatable {}

class InitialMainPageState extends MainPageState {
  @override
  List<Object> get props => [];
}

class LoadingMainPageState extends MainPageState {
  @override
  List<Object> get props => [];
}

class UnSuccessfulMainPageState extends MainPageState {
  @override
  List<Object> get props => [];
}

class SuccessfulMainPageState extends MainPageState {
  final List<Character> characters;

  SuccessfulMainPageState(this.characters);

  @override
  List<Object> get props => [characters];
}
