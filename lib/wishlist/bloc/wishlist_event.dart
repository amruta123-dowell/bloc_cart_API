part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}

class RemoveItemWishListEvent extends WishlistEvent {
  final ProductDataModel productDataModel;

  RemoveItemWishListEvent(this.productDataModel);
}

class WishListInitialEvent extends WishlistEvent {}

class AddToCartFromWishListEvent extends WishlistEvent {
  final ProductDataModel productDataModel;

  AddToCartFromWishListEvent(this.productDataModel);
}
