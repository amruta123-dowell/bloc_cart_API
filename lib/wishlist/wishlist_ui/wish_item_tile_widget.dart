import 'package:bloc_cart/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter/material.dart';

import '../../cart/cartBloc_folder/cart_bloc.dart';
import '../../home/home_models/product_data_model.dart';

class WishItemTileWidget extends StatelessWidget {
  final WishlistBloc wishlistBloc;
  final ProductDataModel itemModel;

  const WishItemTileWidget(
      {required this.wishlistBloc, required this.itemModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black),
        ),
        margin: const EdgeInsets.symmetric(vertical: 20),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(itemModel.imgUrl))),
            ),
            const SizedBox(height: 20),
            Text(
              itemModel.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(itemModel.description),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$ ${itemModel.price}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          wishlistBloc
                              .add(AddToCartFromWishListEvent(itemModel));
                        },
                        icon: const Icon(Icons.shopping_bag)),
                    IconButton(
                        onPressed: () {
                          wishlistBloc.add(RemoveItemWishListEvent(itemModel));
                        },
                        icon: const Icon(Icons.delete))
                  ],
                )
              ],
            )
          ],
        ));
  }
}
