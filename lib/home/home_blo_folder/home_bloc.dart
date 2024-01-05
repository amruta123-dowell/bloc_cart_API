import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_cart/data/cart_list_data.dart';
import 'package:bloc_cart/data/grocery_data.dart';
import 'package:bloc_cart/data/wish_list_data.dart';
import 'package:bloc_cart/home/home_models/product_data_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(getInitialData);
    on<HomeWishListClickButtonEvent>(onClickHomeWishlist);
    on<HomeAddToCartClickButtonEvent>(onClickHomeCart);
    on<HomeCartNavigateButtonEvent>(navigateCartScreen);
    on<HomeWishListNavigateButtonEvent>(navigateWishListScreen);
  }
  FutureOr<void> getInitialData(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    //loading
    emit(HomeLoadingState());
    //For success response
    await Future.delayed(const Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        listProduct: GroceryData.groceryList
            .map((e) => ProductDataModel(
                id: e["id"].toString(),
                name: e["productName"],
                description: e["description"],
                price: e["price"].toString(),
                imgUrl: e["imageURL"]))
            .toList()));
  }

  FutureOr<void> onClickHomeWishlist(
      HomeWishListClickButtonEvent event, Emitter<HomeState> emit) {
    print("the wishlist button is clicked...");
    listWishList.add(event.wishListData);
    emit(AddToWishListActionState());
  }

  FutureOr<void> onClickHomeCart(
      HomeAddToCartClickButtonEvent event, Emitter<HomeState> emit) {
    print("Add to cart button is clicked...");
    listCart.add(event.cartData);
    emit(AddToCartActionState());
  }

  FutureOr<void> navigateCartScreen(
      HomeCartNavigateButtonEvent event, Emitter<HomeState> emit) {
    print("Navigate to cart screen....");
    emit(HomeNavToCartActionState());
  }

  FutureOr<void> navigateWishListScreen(
      HomeWishListNavigateButtonEvent event, Emitter<HomeState> emit) {
    print("Navigate to wishlist screen...");
    emit(HomeNavToWishListActionState());
  }
}
