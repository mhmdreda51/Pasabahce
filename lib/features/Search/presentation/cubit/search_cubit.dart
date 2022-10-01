import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  //===============================================================
  static SearchCubit get(context) => BlocProvider.of(context);

//===============================================================
  RangeValues currentRangeValues = const RangeValues(0, 100);

//===============================================================
  static String _valueToString(double value) {
    return value.toStringAsFixed(0);
  }

//===============================================================

  changeSelectedFilterButton() {
    emit(ChangeSelectedFilterButton());
  }

//===============================================================
  changePriceSlider(RangeValues values) {
    currentRangeValues = values;
    emit(ChangePriceSlider());
  }
//===============================================================
}
