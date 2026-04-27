import 'package:flutter/material.dart';
import 'package:menuu/core/colors.dart';
import 'package:menuu/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class Teaz extends StatefulWidget {
  const Teaz({super.key});

  @override
  State<Teaz> createState() => _TeazState();
}

class _TeazState extends State<Teaz> {
  final List<Map<String, dynamic>> _teaz = [
    {
      "ady": "Honey Citron",
      "baha": 30.0,
      "surat": "assets/images/teaz.jpg",
      "desc":
          "Honey Citron - bal we sitrus goşulan täze ýapraklardan taýýarlanan rahatladjy we şirin çäýrek.",
    },
    {
      "ady": "Apple Ginger",
      "baha": 30.0,
      "surat": "assets/images/teaz.jpg",
      "desc":
          "Apple Ginger - alma we ginger bilen kombinirlenen güýçli we salkyn çäýrek, saglyk üçin peýdaly.",
    },
    {
      "ady": "Very Berry",
      "baha": 30.0,
      "surat": "assets/images/teaz.jpg",
      "desc":
          "Very Berry - dürli berries (çilek, kuş üzümü we ş.m.) bilen baýlaşdyrylan we täze çäýrek.",
    },
    {
      "ady": "Moroccan Mint",
      "baha": 30.0,
      "surat": "assets/images/teaz.jpg",
      "desc":
          "Moroccan Mint - Täze nan we moroccan usulyndaky mintsiz çäýrek, arassaýjy we rahatladjy tagam.",
    },
    {
      "ady": "Black",
      "baha": 15.0,
      "surat": "assets/images/teaz.jpg",
      "desc":
          "Black - Klasik gara çäýrek, güýçli tagam we gündelik güýjiňiz üçin ajaýyp.",
    },
    {
      "ady": "Green",
      "baha": 15.0,
      "surat": "assets/images/teaz.jpg",
      "desc":
          "Green - ýaşyl çäýrek, sagdynlygy ýokarlandyrýan we damakda ýeňil tagam galdyrýar.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: _teaz.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 10,
            mainAxisExtent: 300,
          ),
          itemBuilder: (context, index) {
            final item = _teaz[index];
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
                        (item) => item['ady'] == _teaz[index]['ady'],
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
                                      _teaz[index]['ady'],
                                      quantity - 1,
                                    );
                                  } else {
                                    cart.removeItem(_teaz[index]['ady']);
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
                                    _teaz[index]['ady'],
                                    quantity + 1,
                                  );
                                },
                              ),
                            ],
                          )
                          : OutlinedButton(
                            onPressed: () {
                              cart.addItem(_teaz[index]);
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
