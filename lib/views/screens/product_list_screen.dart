import 'package:flutter/material.dart';
import 'package:flutter_api_integration/data/model/product_model.dart';
import 'package:flutter_api_integration/data/services/api_service.dart';
import 'package:flutter_api_integration/views/widgets/product_card.dart';
import 'package:flutter_api_integration/views/widgets/shimmer_loading.dart';


class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  List<Product> products = [];
  bool isLoading = true;
  bool isGrid = false;

  Future loadProducts() async {

    try {
      final data = await ApiService.fetchProducts();

      setState(() {
        products = data;
        isLoading = false;
      });

    } catch (e) {

      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Products"),

        actions: [

          IconButton(
            icon: Icon(isGrid ? Icons.list : Icons.grid_view),
            onPressed: () {
              setState(() {
                isGrid = !isGrid;
              });
            },
          )
        ],
      ),

      body: RefreshIndicator(

        onRefresh: loadProducts,

        child: isLoading
            ? const ShimmerLoading()
            : isGrid
            ? GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
          ),
          itemCount: products.length,
          itemBuilder: (_, i) => ProductCard(product: products[i]),
        )
            : ListView.builder(
          itemCount: products.length,
          itemBuilder: (_, i) => SizedBox(
            height: 120,
            child: ProductCard(product: products[i]),
          ),
        ),
      ),
    );
  }
}