import 'package:flutter/material.dart';
import 'package:menuu/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class Salatlar extends StatefulWidget {
  const Salatlar({super.key});

  @override
  State<Salatlar> createState() => _SalatlarState();
}

class _SalatlarState extends State<Salatlar> {
  final List<Map<String, dynamic>> _salatlar = [
    {
      "ady": "Älem goşar salat",
      "baha": 15.0,
      "surat": "assets/images/Alemgosar.png",
    },
    {
      "ady": "Awakadoly salat",
      "baha": 50.0,
      "surat": "assets/images/AwakadolySalat.png",
    },
    {"ady": "Crispi salat", "baha": 20.0, "surat": "assets/images/crispi.png"},
    {
      "ady": "Etli oliwiyely salat",
      "baha": 25.0,
      "surat": "assets/images/EtliOlivie.png",
    },
    {
      "ady": "Podşuba salat",
      "baha": 25.0,
      "surat": "assets/images/PodShuba.png",
    },
    {
      "ady": "Towuk Doşli Apelsinli salat",
      "baha": 50.0,
      "surat": "assets/images/TowukDosApelsin.png",
    },
    {
      "ady": "Towukly sezar salat",
      "baha": 50.0,
      "surat": "assets/images/TowuklySezar.png",
    },
    {
      "ady": "Tunaly Sezar salat",
      "baha": 50.0,
      "surat": "assets/images/TunalySezar.png",
    },
    {
      "ady": "Tunaly Niçoise salat",
      "baha": 50.0,
      "surat": "assets/images/TunaNicoise.png",
    },
    {
      "ady": "Vitaminka salat",
      "baha": 15.0,
      "surat": "assets/images/Vitaminka.png",
    },
    {
      "ady": "Yaşyl salat",
      "baha": 20.0,
      "surat": "assets/images/YasylSalat.png",
    },
    {
      "ady": "Yeňil Tunaly salat",
      "baha": 30.0,
      "surat": "assets/images/YenilTunaSalat.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: _salatlar.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 10,
            mainAxisExtent: 300,
            childAspectRatio: 0.75,
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
                        image: AssetImage(_salatlar[index]["surat"]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${_salatlar[index]["baha"].toInt()} TMT",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      _salatlar[index]["ady"],
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Spacer(),
                  Consumer<CartProvider>(
                    builder: (context, cart, child) {
                      final itemInCart = cart.selectedItems.firstWhere(
                        (item) => item['ady'] == _salatlar[index]['ady'],
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
                                      _salatlar[index]['ady'],
                                      quantity - 1,
                                    );
                                  } else {
                                    cart.removeItem(_salatlar[index]['ady']);
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
                                    _salatlar[index]['ady'],
                                    quantity + 1,
                                  );
                                },
                              ),
                            ],
                          )
                          : OutlinedButton(
                            onPressed: () {
                              cart.addItem(_salatlar[index]);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  duration: Duration(milliseconds: 150),
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
