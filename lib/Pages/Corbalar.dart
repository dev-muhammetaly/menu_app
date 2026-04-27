import 'package:flutter/material.dart';
import 'package:menuu/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class Corbalar extends StatefulWidget {
  const Corbalar({super.key});

  @override
  State<Corbalar> createState() => _CorbalarState();
}

class _CorbalarState extends State<Corbalar> {
  final List<Map<String, dynamic>> _corbalar = [
    {
      "ady": "Kädili çorba",
      "baha": 40.0,
      "surat": "assets/images/kadilicorba.png",
    },
    {
      "ady": "Merjimek çorba",
      "baha": 30.0,
      "surat": "assets/images/merjimekcorba.png",
    },
    {
      "ady": "Noybaly çorba",
      "baha": 40.0,
      "surat": "assets/images/noybalycorba.png",
    },
    {
      "ady": "Peýnirli çorba",
      "baha": 40.0,
      "surat": "assets/images/peynirlicorba.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: _corbalar.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 items per row
            crossAxisSpacing: 20,
            mainAxisSpacing: 10,
            mainAxisExtent: 300,
            childAspectRatio: 0.75, // adjust height/width ratio
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(_corbalar[index]["surat"]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${_corbalar[index]["baha"].toInt()} TMT",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      _corbalar[index]["ady"],
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Spacer(),
                  Consumer<CartProvider>(
                    builder: (context, cart, child) {
                      final itemInCart = cart.selectedItems.firstWhere(
                        (item) => item['ady'] == _corbalar[index]['ady'],
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
                                      _corbalar[index]['ady'],
                                      quantity - 1,
                                    );
                                  } else {
                                    cart.removeItem(_corbalar[index]['ady']);
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
                                    _corbalar[index]['ady'],
                                    quantity + 1,
                                  );
                                },
                              ),
                            ],
                          )
                          : OutlinedButton(
                            onPressed: () {
                              cart.addItem(_corbalar[index]);
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
