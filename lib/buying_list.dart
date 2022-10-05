import 'package:flutter/material.dart';
import 'package:quiz/detail_product.dart';
import 'package:quiz/groceries.dart';

class ListBelanja extends StatefulWidget {
  const ListBelanja({Key? key}) : super(key: key);

  @override
  State<ListBelanja> createState() => _ListBelanjaState();
}

class _ListBelanjaState extends State<ListBelanja> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Groceries'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final Groceries products = groceryList[index];

          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ProductDetail(products: products);
              }));
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    products.storeName,
                    style: TextStyle(
                      fontSize: 32,
                    ),
                  ),
                  Image.network(products.productImageUrls[0], width: 250),
                  Text(
                    products.name,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'Rp' + products.price,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: groceryList.length,
      ),
    );
  }
}
