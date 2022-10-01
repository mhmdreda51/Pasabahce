import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  //===============================================================
  static CartCubit get(context) => BlocProvider.of(context);

  //===============================================================
  late bool deleting = false;

  //===============================================================

  void changeDeleting() {
    deleting = !deleting;
    emit(ChangeDeletingState());
  }
}
