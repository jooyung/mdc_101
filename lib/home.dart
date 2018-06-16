import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mdc_101/model/data.dart';
import 'package:mdc_101/model/product.dart';

class HomePage extends StatelessWidget {
  List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = getProducts(Category.all);

    if (products == null || products.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
      locale: Localizations.localeOf(context).toString(),
    );

    return products.map((product) {
      return Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18 / 11,
              child: Image.asset(
                product.assetName,
                fit: BoxFit.fitWidth,
                package: product.assetPackage,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      product.name,
                      style: theme.textTheme.title,
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      formatter.format(
                        product.price,
                      ),
                      style: theme.textTheme.body2,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: new Color(0xff900000),
          onPressed: () {
            print('Menu Button');
          },
        ),
        title: Text(
          'Shrine',
          style: TextStyle(
            color: new Color(0xff900000),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: new Color(0xFF900000),
            onPressed: () {
              print('Search Button');
            },
          ),
          IconButton(
            icon: Icon(Icons.tune),
            color: new Color(0xff900000),
            onPressed: () {
              print('Filter Button');
            },
          ),
        ],
        elevation: 8.0,
        backgroundColor: new Color(0xFFFFffff),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 9.0,
        children: _buildGridCards(context),
      ),
    );
  }
}
