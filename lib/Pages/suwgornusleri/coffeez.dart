import 'package:flutter/material.dart';
import 'package:menuu/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class Coffeez extends StatefulWidget {
  const Coffeez({super.key});

  @override
  State<Coffeez> createState() => _CoffeezState();
}

class _CoffeezState extends State<Coffeez> {
  final List<Map<String, dynamic>> _coffeez = [
    {"ady": "Espresso", "baha": 25.0, "surat": "assets/images/coffee.jpg"},
    {"ady": "Americano", "baha": 25.0, "surat": "assets/images/coffee.jpg"},
    {"ady": "Flat white", "baha": 30.0, "surat": "assets/images/coffee.jpg"},
    {"ady": "Cappuccino", "baha": 30.0, "surat": "assets/images/coffee.jpg"},
    {"ady": "Latte", "baha": 30.0, "surat": "assets/images/coffee.jpg"},
    {"ady": "Mocha", "baha": 35.0, "surat": "assets/images/coffee.jpg"},
    {"ady": "Hot chocolate", "baha": 35.0, "surat": "assets/images/coffee.jpg"},
    {"ady": "Raf", "baha": 35.0, "surat": "assets/images/coffee.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: _coffeez.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 10,
            mainAxisExtent: 300,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            final item = _coffeez[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(item["surat"]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${item["baha"].toInt()} TMT",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      item["ady"],
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Spacer(),
                  Consumer<CartProvider>(
                    builder: (context, cart, child) {
                      final itemInCart = cart.selectedItems.firstWhere(
                        (item) => item['ady'] == _coffeez[index]['ady'],
                        orElse: () => {'quantity': 0},
                      );
                      final int quantity = itemInCart['quantity'] as int? ?? 0;

                      return quantity > 0
                          ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  if (quantity > 1) {
                                    cart.updateQuantity(
                                      _coffeez[index]['ady'],
                                      quantity - 1,
                                    );
                                  } else {
                                    cart.removeItem(_coffeez[index]['ady']);
                                  }
                                },
                              ),
                              Text(
                                quantity.toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  cart.updateQuantity(
                                    _coffeez[index]['ady'],
                                    quantity + 1,
                                  );
                                },
                              ),
                            ],
                          )
                          : OutlinedButton(
                            onPressed: () {
                              cart.addItem(_coffeez[index]);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Sebede gosuldy!"),
                                  action: SnackBarAction(
                                    label: '',
                                    onPressed: () {},
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              'Sebede gosmak',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              ),
                            ),
                          );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
