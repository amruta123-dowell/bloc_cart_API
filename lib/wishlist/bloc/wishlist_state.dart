// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}

abstract class WishlistActionState extends WishlistState {}

class WishlistInitialState extends WishlistState {}

class WishlistBlocInitial extends WishlistState {}

class WishlistSuccessState extends WishlistState {
  final List<ProductDataModel> wishlistData;

  WishlistSuccessState({required this.wishlistData});
}

//No use - work on this why it is not used
class RemoveWishListItemState extends WishlistActionState {}

class AddToCartFromWishListState extends WishlistActionState {}
