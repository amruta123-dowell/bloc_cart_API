import 'package:bloc_cart/cart/cartBloc_folder/cart_bloc.dart';
import 'package:bloc_cart/wishlist/bloc/wishlist_bloc.dart';
import 'package:bloc_cart/wishlist/wishlist_ui/wish_item_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  final WishlistBloc wishlistBloc = WishlistBloc();
  @override
  void initState() {
    wishlistBloc.add(WishListInitialEvent());
    return super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wishlist screen"),
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is! WishlistActionState,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistSuccessState:
              final successState = state as WishlistSuccessState;
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.builder(
                        padding:
                            const EdgeInsets.only(top: 20, right: 20, left: 20),
                        shrinkWrap: true,
                        itemCount: state.wishlistData.length,
                        itemBuilder: (context, index) {
                          return WishItemTileWidget(
                              wishlistBloc: wishlistBloc,
                              itemModel: state.wishlistData[index]);
                        }),
                  )
                ],
              );

            default:
              return const SizedBox.shrink();
          }
          // return Column(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [],
          // );
        },
      ),
    );
  }
}
