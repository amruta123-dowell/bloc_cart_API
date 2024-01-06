part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartInitialEvent extends CartEvent {}

class RemoveCartActionEvent extends CartEvent {
  final ProductDataModel productDataModel;

  RemoveCartActionEvent({required this.productDataModel});
}

class AddToWishListFromCartEvent extends CartEvent {
  final ProductDataModel productDataModel;

  AddToWishListFromCartEvent({required this.productDataModel});
}
