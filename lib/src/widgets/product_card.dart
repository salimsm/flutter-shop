import 'package:flutter/material.dart';
import '../const/const.dart';

class ProductCart extends StatelessWidget {
//   https://dribbble.com/shots/16755367-WECOM-Ecommerce-App/attachments/11803289?mode=media
  final String? imageUrl;
  final String productName;
  final double productPrice;

  // ignore: use_key_in_widget_constructors
  const ProductCart(
      {Key? key,
      this.imageUrl,
      required this.productName,
      required this.productPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
        margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 4),
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2.0,
                  spreadRadius: 1.0,
                  offset: Offset(2, 2))
            ]),
        child: Column(
          children: [
            imageUrl != null
                ? Image.network(
                    imageUrl!,
                    height: 100,
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                  )
                : const SizedBox(
                    height: 100,
                    width: 100,
                    child: Icon(Icons.error),
                  ),
            const SizedBox(height: 8),
            SizedBox(
              height: 38.0,
              child: Text(
                productName,
                style: const TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ),
            const Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$ $productPrice",
                  style: const TextStyle(fontSize: 17),
                  maxLines: 2,
                ),
                GestureDetector(
                    onTap: () {
                      //print('added');
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          color: AppColor.kPrimary,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(8))),
                      child: const Icon(
                        Icons.shopping_cart,
                        size: 14,
                      ),
                    )),
              ],
            ),
          ],
        ));
  }
}


