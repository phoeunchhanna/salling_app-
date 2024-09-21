import 'package:cart_app/menu/footer.dart';
import 'package:cart_app/menu/navigation.dart';
import 'package:cart_app/screen/cart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: _scaffoldKey,
      title: 'CC App ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: ProductListPage(),
    );
  }
}

class ProductListPage extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      "name": "India Dress",
      "price": 110.00,
      "image": "/images/dress1.png",
      "brand": "Dress for Gril India"
    },
    {
      "name": "Man  Dress",
      "price": 69.00,
      "image": "/images/dress2.png",
      "brand": "Bast Man dress"
    },
    {
      "name": "Style man Dress",
      "price": 110.00,
      "image": "/images/dress3.jpg",
      "brand": "Men tyle "
    },
    {
      "name": "Univert student",
      "price": 69.00,
      "image": "/images/dress5.png",
      "brand": "Cute Student"
    },
      {
      "name": "Style man Dress",
      "price": 110.00,
      "image": "/images/dress3.jpg",
      "brand": "Men tyle "
    },
    {
      "name": "Student clothe",
      "price": 69.00,
      "image": "/images/dress4.png",
      "brand": "Cute Student"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
       
        title: Text(
          'Product List',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.production_quantity_limits, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      Cart(), // Replace this with your cart page widget
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          PopupMenuButton<int>(
            itemBuilder: (context) => [
              const PopupMenuItem(
                child: ListTile(
                  title: Text('Settings'),
                  trailing: Icon(Icons.settings),
                ),
              ),
              const PopupMenuItem(
                child: ListTile(
                  title: Text('Populer '),
                  trailing: Icon(Icons.share),
                ),
              ),
              const PopupMenuItem(
                child: ListTile(
                  title: Text('Favarit'),
                  trailing: Icon(Icons.favorite),
                ),
              ),
            ],
          )
        ],
      ),
      drawer:const Navigation(),

      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: DefaultTabController(
              length: 4,
              child: TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.black,
                tabs: [
                  Tab(text: 'New Arrivals'),
                  Tab(text: 'Trending'),
                  Tab(text: 'Brands'),
                  Tab(text: 'Top'),
                  Tab(text: 'clasic'),
                ],
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductCard(
                  name: product['name'],
                  price: product['price'],
                  image: product['image'],
                  brand: product['brand'],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final double price;
  final String image;
  final String brand;

  ProductCard({
    required this.name,
    required this.price,
    required this.image,
    required this.brand,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Center(
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              brand,
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('\$${price.toStringAsFixed(2)}'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.favorite_border),
                Icon(Icons.add_shopping_cart),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
