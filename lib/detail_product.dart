import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:quiz/groceries.dart';

class ProductDetail extends StatefulWidget {
  final Groceries products;
  const ProductDetail({Key? key, required this.products}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.products.name}'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            icon: (isFavorite)
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border),
          ),
        ],
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: (MediaQuery
                  .of(context)
                  .size
                  .height) / 3,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: widget.products.productImageUrls.length,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.network(
                        widget.products.productImageUrls[index],
                        width: 200,
                        height: 210,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
              alignment: Alignment.center,
              child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.green,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 50),
                    Text(widget.products.name,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                        ),
                        Container(
                          child: Text("Rating: ${widget.products.reviewAverage}",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                        ),
                        Container(
                          child: Icon(
                              Icons.star_border,
                            
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                      child: Text(widget.products.description,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: 25),
                    Text("Price : Rp${widget.products.price}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 5),
                    Text("Discount: ${widget.products.discount}",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                      ),
                    ),
                    SizedBox(height: 5),
                    ElevatedButton(
                        onPressed: (){
                          _launchURL(widget.products.productUrl);
                        },
                        child: Text("Store : ${widget.products.storeName}",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                          ),
                        ),
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _launchURL(_url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}
