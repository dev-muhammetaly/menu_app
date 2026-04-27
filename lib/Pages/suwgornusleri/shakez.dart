import 'package:flutter/material.dart';
import 'package:menuu/core/colors.dart';
import 'package:menuu/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class Shakez extends StatefulWidget {
  const Shakez({super.key});

  @override
  State<Shakez> createState() => _ShakezState();
}

class _ShakezState extends State<Shakez> {
  final List<Map<String, dynamic>> _shakez = [
    {
      "ady": "Vanilla",
      "baha": 30.0,
      "surat": "assets/images/shakez.jpg",
      "desc":
          "Vanilla - geleneksel vanilýanyň ýumşak we şirin tagamy bilen taýýarlanan shake.",
    },
    {
      "ady": "Chocolate",
      "baha": 30.0,
      "surat": "assets/images/shakez.jpg",
      "desc":
          "Chocolate - çikolataly, süýji we baý tagamly shake, çokolad severler üçin ajaýyp saýlaw.",
    },
    {
      "ady": "Strawberry",
      "baha": 30.0,
      "surat": "assets/images/shakez.jpg",
      "desc":
          "Strawberry - täze çilekleriň tagamy bilen baýlaşdyrylan, arzan we täze shake.",
    },
    {
      "ady": "Bubble gum",
      "baha": 30.0,
      "surat": "assets/images/shakez.jpg",
      "desc":
          "Bubble gum - köpüli görnüşde şirin we şadyýan tagam bilen bubble gum shake.",
    },
    {
      "ady": "Oreo",
      "baha": 30.0,
      "surat": "assets/images/shakez.jpg",
      "desc":
          "Oreo - Oreo peçenyýalarynyň tagamy bilen baýlaşdyrylan we şirin shake.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: _shakez.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 10,
            mainAxisExtent: 300,
          ),
          itemBuilder: (context, index) {
            final item = _shakez[index];
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
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  const Spacer(),
                  Consumer<CartProvider>(
                    builder: (context, cart, child) {
                      final itemInCart = cart.selectedItems.firstWhere(
                        (item) => item['ady'] == _shakez[index]['ady'],
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
                                      _shakez[index]['ady'],
                                      quantity - 1,
                                    );
                                  } else {
                                    cart.removeItem(_shakez[index]['ady']);
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
                                    _shakez[index]['ady'],
                                    quantity + 1,
                                  );
                                },
                              ),
                            ],
                          )
                          : OutlinedButton(
                            onPressed: () {
                              cart.addItem(_shakez[index]);
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
