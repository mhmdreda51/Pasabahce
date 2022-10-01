part of 'search_cubit.dart';

abstract class SearchState {
  const SearchState();
}

class SearchInitial extends SearchState {}

class ChangeSelectedFilterButton extends SearchState {}

class ChangePriceSlider extends SearchState {}
