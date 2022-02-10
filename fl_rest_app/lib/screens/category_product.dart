import 'package:fl_rest_app/ap_service/api_service.dart';
import 'package:fl_rest_app/screens/product_detail.dart';
import 'package:flutter/material.dart';

class CategoryProductScreen extends StatelessWidget {
  final String categoryName;
  CategoryProductScreen(this.categoryName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryName.toUpperCase(),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),

      // FOR CREAT OF GETPRODUCTBYCATEGORIE
      body: FutureBuilder(
        future: ApiService().getProductByCategory(categoryName),
        builder: (context, AsyncSnapshot snapshot) {
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data[index]['title']),
                  // pose
                  leading: Image.network(
                    snapshot.data[index]['image'],
                    height: 50,
                    width: 30,
                  ),
                  subtitle: Text(
                    "Price - \$" + snapshot.data[index]['price'].toString(),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ProductDetail(snapshot.data[index]['id'])));
                  },
                );
              });
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
