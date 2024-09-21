import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Your Cart',
            style: TextStyle(
              color:
                  Color.fromARGB(255, 12, 12, 12), 
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
      body: CartPage(),
    );
  }
}

class CartPage extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems = [
    {
      "name": "India Dress",
      "price": 69.00,
      "image": "assets/images/dress1.png",
      "size": "S",
      "color": Colors.black,
      "quantity": 1
    },
    {
      "name": "Classic boy",
      "price": 77.00,
      "image": "assets/images/dress2.png",
      "size": "S",
      "color": Colors.purple,
      "quantity": 1
    },
    {
      "name": "Stye boy",
      "price": 69.00,
      "image": "assets/images/dress3.jpg",
      "size": "S",
      "color": Colors.black,
      "quantity": 1
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return CartItemCard(
                  name: item['name'],
                  price: item['price'],
                  image: item['image'],
                  size: item['size'],
                  color: item['color'],
                  quantity: item['quantity'],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Price',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\$215',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.black,
                  ),
                  child: Text(
                    'Payment',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartItemCard extends StatelessWidget {
  final String name;
  final double price;
  final String image;
  final String size;
  final Color color;
  final int quantity;

  CartItemCard({
    required this.name,
    required this.price,
    required this.image,
    required this.size,
    required this.color,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  image,
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text('\$$price', style: TextStyle(color: Colors.grey)),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Text('Size: $size',
                            style: TextStyle(color: Colors.grey)),
                        SizedBox(width: 16),
                        Text('Color: ', style: TextStyle(color: Colors.grey)),
                        Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                    },
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                        },
                      ),
                      Text('$quantity'),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
