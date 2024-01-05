part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

///initial event
class HomeInitialEvent extends HomeEvent {}

///Add to wishlist event
class HomeWishListClickButtonEvent extends HomeEvent {
  //To pass the data through the event
  final ProductDataModel wishListData;

  HomeWishListClickButtonEvent({required this.wishListData});
}

///Add to cart event
class HomeAddToCartClickButtonEvent extends HomeEvent {
  final ProductDataModel cartData;

  HomeAddToCartClickButtonEvent({required this.cartData});
}

///Navigate wishList screen
class HomeWishListNavigateButtonEvent extends HomeEvent {}

///Navigate to cart screen
class HomeCartNavigateButtonEvent extends HomeEvent {}
