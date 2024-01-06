import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_cart/cart/cartBloc_folder/cart_bloc.dart';
import 'package:bloc_cart/data/cart_list_data.dart';
import 'package:bloc_cart/data/wish_list_data.dart';
import 'package:bloc_cart/home/home_models/product_data_model.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistBlocInitial()) {
    on<WishListInitialEvent>(getWishListElements);
    on<RemoveItemWishListEvent>(removeItemWishList);
    on<AddToCartFromWishListEvent>(addToCartFromWishList);
  }

  FutureOr<void> getWishListElements(
    WishListInitialEvent event,
    Emitter<WishlistState> emit,
  ) {
    emit(WishlistSuccessState(wishlistData: listWishList));
  }

  removeItemWishList(
      RemoveItemWishListEvent event, Emitter<WishlistState> emit) {
    listWishList.remove(event.productDataModel);
    emit(WishlistSuccessState(wishlistData: listWishList));
  }

  FutureOr<void> addToCartFromWishList(
      AddToCartFromWishListEvent event, Emitter<WishlistState> emit) {
    listCart.add(event.productDataModel);
    emit(AddToCartFromWishListState());
  }
}
