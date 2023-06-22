import 'package:flutter/material.dart';

import '../common/common.dart';
import '../const/const.dart';
import '../models/models.dart';
import '../utils/utils.dart';
import '../widgets/widgets.dart';

class DetailPage extends StatelessWidget {
  final Product product;

  const DetailPage(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingIcon: Icons.chevron_left,
        leadingIconOnPress: () {
          navigateBackTo(context);
        },
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        color: AppColor.kBackground,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.maxFinite,
                  color: AppColor.kWhite,
                  child: Image.network(
                    product.image,
                    height: 220,
                    width: double.maxFinite,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  product.title,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                RatingSectionCard(
                  rate: product.rating.rate,
                  count: product.rating.count,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '\$${product.price}',
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                DescriptionSection(
                  descriptionTitle: AppString.category,
                  descriptionBody: product.category,
                ),
                const SizedBox(
                  height: 10,
                ),
                DescriptionSection(
                  descriptionTitle: AppString.description,
                  descriptionBody: product.description,
                ),
                CustomButton(
                  onPress: () {},
                  icon: Icons.shopping_cart,
                  text: AppString.addToCart,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
