import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_10/src/const/colors/colors.dart';

import '../models/models.dart';
import '../services/rest_client.dart';
import '../widgets/product_card.dart';
import 'detail_page.dart';

const categoryList = [
  "electronics",
  "jewelery",
  "men's clothing",
  "women's clothing"
];

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);
  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  String category = categoryList[0];

  void onCategorySelected(String selectedCategory) {
    setState(() {
      category = selectedCategory;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kPrimary,
        title: const Text('Select Category You Looking for'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColor.kBackground,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                children: categoryList
                    .map((categoryName) => InkWell(
                          onTap: () => onCategorySelected(categoryName),
                          child: CategoryCard(
                            categoryName: categoryName,
                          ),
                        ))
                    .toList(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  category.toUpperCase(),
                  style: TextStyle(fontSize: 18),
                ),
              ),
              _body(category),
            ],
          ),
        ),
      ),
    );
  }
}

FutureBuilder _body(String category) {
  final apiService =
      RestClient(Dio(BaseOptions(contentType: "application/json")));
  return FutureBuilder(
      future: apiService.getCategoriesDataList(category),
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
  return Column(
    children: [
      // const OfferSection(),
      GridView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: productList.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 190,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            mainAxisExtent: 200,
          ),
          itemBuilder: (context, index) {
            Product product = productList[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DetailPage(product)));
              },
              child: ProductCart(
                productName: product.title,
                productPrice: product.price,
                imageUrl: product.image,
              ),
            );
          }),
    ],
  );
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({required this.categoryName, super.key});
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: AppColor.kWhite,
          border: Border(
            bottom: BorderSide(
              color: AppColor.kPrimary,
              width: 2,
            ),
          ),
          boxShadow: [
            BoxShadow(
                color: AppColor.kPrimary, spreadRadius: 0.5, blurRadius: 1),
          ],
        ),
        child: Text(categoryName),
      ),
    );
  }
}
