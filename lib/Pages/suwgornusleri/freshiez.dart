import 'package:flutter/material.dart';
import 'package:menuu/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class Freshiez extends StatefulWidget {
  const Freshiez({super.key});

  @override
  State<Freshiez> createState() => _FreshiezState();
}

class _FreshiezState extends State<Freshiez> {
  final List<Map<String, dynamic>> _freshiezList = [
    {
      "ady": "Orange",
      "baha": 50.0,
      "surat": "assets/images/freshiez.jpg",
      "detailed":
          "Täze siýilen apelsin şiresi - C witaminine baý we ruhlandyryjy tagam.",
    },
    {
      "ady": "Apple",
      "baha": 45.0,
      "surat": "assets/images/freshiez.jpg",
      "detailed":
          "Sagdynlygy üpjün edýän alma şiresi - tebigy süýji we peýdaly görnüş.",
    },
    {
      "ady": "Apple-Carrot",
      "baha": 40.0,
      "surat": "assets/images/freshiez.jpg",
      "detailed":
          "Alma bilen käşiriň utgaşmasy - süýji we peýdaly tagamlaryň sazlaşygy.",
    },
    {
      "ady": "Mix",
      "baha": 45.0,
      "surat": "assets/images/freshiez.jpg",
      "detailed":
          "Apelsin, alma we käşirden taýýarlanan garysyk şire - baý we orazaň saýlaw.",
    },
    {
      "ady": "Carrot",
      "baha": 30.0,
      "surat": "assets/images/freshiez.jpg",
      "detailed":
          "Täze käşir şiresi - beta-karotiniň we antioksidantlaryň gory.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: _freshiezList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 10,
            mainAxisExtent: 300,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            final item = _freshiezList[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.orange,
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
                        (item) => item['ady'] == _freshiezList[index]['ady'],
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
                                      _freshiezList[index]['ady'],
                                      quantity - 1,
                                    );
                                  } else {
                                    cart.removeItem(
                                      _freshiezList[index]['ady'],
                                    );
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
                                    _freshiezList[index]['ady'],
                                    quantity + 1,
                                  );
                                },
                              ),
                            ],
                          )
                          : OutlinedButton(
                            onPressed: () {
                              cart.addItem(_freshiezList[index]);
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
