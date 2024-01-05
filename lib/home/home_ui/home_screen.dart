import 'package:bloc_cart/cart/cart_ui/cart_screen.dart';
import 'package:bloc_cart/home/home_blo_folder/home_bloc.dart';
import 'package:bloc_cart/home/home_ui/product_tile_widget.dart';
import 'package:bloc_cart/wishlist/wishlist_ui/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc homeBloc = HomeBloc();
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeNavToCartActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CartScreen()));
        } else if (state is HomeNavToWishListActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const WishListScreen()));
        } else if (state is AddToCartActionState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("the product is added To cart successfully..")));
        } else if (state is AddToWishListActionState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content:
                  Text("the product is added to wishlist successfully..")));
        }
      },
      //To build - When u don't get action state
      buildWhen: (previous, current) => current is! HomeActionState,
      //To listen - when u get action state (For eg. nav)
      listenWhen: (previous, current) => current is HomeActionState,
      bloc: homeBloc,

      builder: (context, state) {
        Widget? widget;
        switch (state.runtimeType) {
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            widget = Scaffold(
              appBar: AppBar(
                title: const Text("Amruta Grocery center"),
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeWishListNavigateButtonEvent());
                      },
                      icon: const Icon(Icons.favorite)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeCartNavigateButtonEvent());
                      },
                      icon: const Icon(Icons.shopping_bag_outlined))
                ],
              ),
              body: ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                  itemCount: successState.listProduct.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductTileWidget(
                        homeBloc: homeBloc,
                        productDataModel: successState.listProduct[index]);
                  }),
            );
            break;
          case HomeLoadingState:
            widget = const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
            break;
          case HomeErrorState:
            widget = const SizedBox();
            break;
        }
        return widget ?? const SizedBox();
      },
    );
  }
}
