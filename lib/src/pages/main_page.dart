import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../const/const.dart';
import '../models/models.dart';
import '../services/rest_client.dart';
import '../utils/utils.dart';
import '../widgets/widgets.dart';
import 'pages.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: AppString.homePageTitle,
          trailingIcon: Icons.search,
          trailingIconOnPress: () {
            navigateTo(context, const SearchPage());
          }),
      body: _body(),
    );
  }
}

FutureBuilder _body() {
  final apiService =
      RestClient(Dio(BaseOptions(contentType: "application/json")));
  return FutureBuilder(
      future: apiService.getProductList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          List<Product> list = snapshot.data;
          return _productList(list);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      });
}

Widget _productList(List<Product> productList) {
  return SingleChildScrollView(
    child: Column(
      children: [
        // const OfferSection(),
        GridView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: productList.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 180,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              mainAxisExtent: 200,
            ),
            itemBuilder: (context, index) {
              Product product = productList[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => DetailPage(product)));
                },
                child: ProductCart(
                  productName: product.title,
                  productPrice: product.price,
                  imageUrl: product.image,
                ),
              );
            }),
      ],
    ),
  );
}
