import 'package:flutter/material.dart';
import 'package:menuu/core/colors.dart';
import 'package:menuu/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class Mojitos extends StatefulWidget {
  const Mojitos({super.key});

  @override
  State<Mojitos> createState() => _MojitosState();
}

class _MojitosState extends State<Mojitos> {
  final List<Map<String, dynamic>> _mojitos = [
    {"ady": "Classic", "baha": 35.0, "surat": "assets/images/moijitos.jpg"},
    {"ady": "Berry", "baha": 35.0, "surat": "assets/images/moijitos.jpg"},
    {"ady": "Mango", "baha": 35.0, "surat": "assets/images/moijitos.jpg"},
    {"ady": "Kiwi", "baha": 35.0, "surat": "assets/images/moijitos.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: _mojitos.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 10,
            mainAxisExtent: 300,
          ),
          itemBuilder: (context, index) {
            final item = _mojitos[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AllColors.systemcolor,
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
                      style: const TextStyle(
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
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  const Spacer(),
                  Consumer<CartProvider>(
                    builder: (context, cart, child) {
                      final itemInCart = cart.selectedItems.firstWhere(
                        (item) => item['ady'] == _mojitos[index]['ady'],
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
                                      _mojitos[index]['ady'],
                                      quantity - 1,
                                    );
                                  } else {
                                    cart.removeItem(_mojitos[index]['ady']);
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
                                    _mojitos[index]['ady'],
                                    quantity + 1,
                                  );
                                },
                              ),
                            ],
                          )
                          : OutlinedButton(
                            onPressed: () {
                              cart.addItem(_mojitos[index]);
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
