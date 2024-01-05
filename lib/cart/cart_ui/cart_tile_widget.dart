import 'package:bloc_cart/home/home_models/product_data_model.dart';
import 'package:flutter/material.dart';

import '../cartBloc_folder/cart_bloc.dart';

class CartTileWidget extends StatelessWidget {
  final CartBloc cartBloc;
  final ProductDataModel productDataModel;
  const CartTileWidget(
      {required this.productDataModel, required this.cartBloc, super.key});

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
                      image: NetworkImage(productDataModel.imgUrl))),
            ),
            const SizedBox(height: 20),
            Text(
              productDataModel.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(productDataModel.description),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$ ${productDataModel.price}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          // cartBloc.add(HomeWishListClickButtonEvent(
                          //     wishListData: productDataModel));
                        },
                        icon: const Icon(Icons.favorite_outline)),
                    IconButton(
                        onPressed: () {
                          // homeBloc.add(HomeAddToCartClickButtonEvent(
                          //     cartData: productDataModel));
                        },
                        icon: const Icon(Icons.shopping_bag)),
                    IconButton(onPressed: () {
                      
                    }, icon: const Icon(Icons.delete))
                  ],
                )
              ],
            )
          ],
        ));
  }
}
