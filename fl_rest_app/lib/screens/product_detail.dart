import 'package:fl_rest_app/ap_service/api_service.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final int id;
  ProductDetail(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
      ),
      // SECOND CREAT OF PRODUCT

      body: FutureBuilder(
        future: ApiService().getSingleProduct(id),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            // container avant singlechildScrolView
            return SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Image.network(
                      snapshot.data['image'],
                      height: 200,
                      width: double.infinity,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        snapshot.data['price'].toString(),
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      // implement GET request to a server
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      snapshot.data['title'],
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    Chip(
                      label: Text(
                        snapshot.data['category'].toString(),
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: Colors.blueGrey,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(snapshot.data['description']),
                  ],
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_shopping_cart),
        onPressed: () async {
          // after create put request
          await ApiService().UpdatCart(1, id);
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Product added to Cart")));
        },
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
