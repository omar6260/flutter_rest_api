import 'package:fl_rest_app/ap_service/api_service.dart';
import 'package:flutter/material.dart';

import 'category_product.dart';

class AllCategory extends StatelessWidget {
  const AllCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category'),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      // THREE CREAT OF ALLCATEGORY
      body: FutureBuilder(
        future: ApiService().getAllCategory(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  // RETURN CARD AVANT INKWELL
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CategoryProductScreen(snapshot.data[index])));
                    },
                    child: Card(
                      elevation: 2,
                      margin: EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(40),
                        child: Center(
                          child: Text(
                            snapshot.data[index].toString().toUpperCase(),
                            style: TextStyle(),
                          ),
                        ),
                      ),
                    ),
                  );
                });
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
