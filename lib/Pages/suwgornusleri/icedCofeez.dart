import 'package:flutter/material.dart';
import 'package:menuu/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class Icedcofeez extends StatefulWidget {
  const Icedcofeez({super.key});

  @override
  State<Icedcofeez> createState() => _IcedcofeezState();
}

class _IcedcofeezState extends State<Icedcofeez> {
  final List<Map<String, dynamic>> _icedcofeez = [
    {"ady": "Orange", "baha": 50.0, "surat": "assets/images/icedcoffee.jpg"},
    {"ady": "Apple", "baha": 45.0, "surat": "assets/images/icedcoffee.jpg"},
    {
      "ady": "Apple-Carrot",
      "baha": 40.0,
      "surat": "assets/images/icedcoffee.jpg",
    },
    {"ady": "Mix", "baha": 45.0, "surat": "assets/images/icedcoffee.jpg"},
    {"ady": "Carrot", "baha": 30.0, "surat": "assets/images/icedcoffee.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: _icedcofeez.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 10,
            mainAxisExtent: 300,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            final item = _icedcofeez[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.orange, // same as coffeez: just a fallback
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
                        (item) => item['ady'] == _icedcofeez[index]['ady'],
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
                                      _icedcofeez[index]['ady'],
                                      quantity - 1,
                                    );
                                  } else {
                                    cart.removeItem(_icedcofeez[index]['ady']);
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
                                    _icedcofeez[index]['ady'],
                                    quantity + 1,
                                  );
                                },
                              ),
                            ],
                          )
                          : OutlinedButton(
                            onPressed: () {
                              cart.addItem(_icedcofeez[index]);
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
