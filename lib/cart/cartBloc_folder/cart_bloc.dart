import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_cart/data/cart_list_data.dart';

import 'package:bloc_cart/data/wish_list_data.dart';
import 'package:bloc_cart/home/home_models/product_data_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialData);

    on<RemoveCartActionEvent>(removeProductFromCart);
    // on<CartEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
  }

  FutureOr<void> removeProductFromCart(
      RemoveCartActionEvent event, Emitter<CartState> emit) {
    print("the product is removed");
  }

  FutureOr<void> cartInitialData(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: listCart));
  }
}
