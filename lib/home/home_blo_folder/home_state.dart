// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

///Building UI
class HomeInitial extends HomeState {}

///To show loading [for  eg. API calls]
class HomeLoadingState extends HomeState {}

///To build UI after getting API success
class HomeLoadedSuccessState extends HomeState {
  final List<ProductDataModel> listProduct;
  HomeLoadedSuccessState({
    required this.listProduct,
  });
}

///To show error If API response fails
class HomeErrorState extends HomeState {}

///Action classes are (Navigate to next Screen) --------->
///Navigate to wishList
class HomeNavToWishListActionState extends HomeActionState {}

///Navigate to cart screen state
class HomeNavToCartActionState extends HomeActionState {}

///Add to cart action state
class AddToCartActionState extends HomeActionState {}

///Add to wishlist action state
class AddToWishListActionState extends HomeActionState {}
