import 'package:flutter/material.dart';
import 'package:menuu/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class Suwlar extends StatefulWidget {
  const Suwlar({super.key});

  @override
  State<Suwlar> createState() => _SuwlarState();
}

class _SuwlarState extends State<Suwlar> {
  final List<Map<String, dynamic>> Suwlar = [
    {"ady": "Espresso", "baha": 25.0, "surat": "assets/images/coffee.jpg"},
    {"ady": "Americano", "baha": 25.0, "surat": "assets/images/coffee.jpg"},
    {"ady": "Flat white", "baha": 30.0, "surat": "assets/images/coffee.jpg"},
    {"ady": "Cappuccino", "baha": 30.0, "surat": "assets/images/coffee.jpg"},
    {"ady": "Latte", "baha": 30.0, "surat": "assets/images/coffee.jpg"},
    {"ady": "Mocha", "baha": 35.0, "surat": "assets/images/coffee.jpg"},
    {"ady": "Hot chocolate", "baha": 35.0, "surat": "assets/images/coffee.jpg"},
    {"ady": "Raf", "baha": 35.0, "surat": "assets/images/coffee.jpg"},
    {"ady": "Orange", "baha": 50.0, "surat": "assets/images/icedcoffee.jpg"},
    {"ady": "Apple", "baha": 45.0, "surat": "assets/images/icedcoffee.jpg"},
    {
      "ady": "Apple-Carrot",
      "baha": 40.0,
      "surat": "assets/images/icedcoffee.jpg",
    },
    {"ady": "Mix", "baha": 45.0, "surat": "assets/images/icedcoffee.jpg"},
    {"ady": "Carrot", "baha": 30.0, "surat": "assets/images/icedcoffee.jpg"},
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
    {"ady": "Citrus", "baha": 30.0, "surat": "assets/images/lemonadez.jpg"},
    {
      "ady": "Mixed berry",
      "baha": 30.0,
      "surat": "assets/images/lemonadez.jpg",
    },
    {
      "ady": "Green Apple",
      "baha": 30.0,
      "surat": "assets/images/lemonadez.jpg",
    },
    {"ady": "Mango", "baha": 30.0, "surat": "assets/images/lemonadez.jpg"},
    {
      "ady": "Hubba bubba",
      "baha": 30.0,
      "surat": "assets/images/lemonadez.jpg",
    },
    {"ady": "Berry Cream", "baha": 35.0, "surat": "assets/images/smothiez.jpg"},
    {"ady": "Vitamin C", "baha": 35.0, "surat": "assets/images/smothiez.jpg"},
    {"ady": "Yoda", "baha": 35.0, "surat": "assets/images/smothiez.jpg"},
    {"ady": "Detox", "baha": 35.0, "surat": "assets/images/smothiez.jpg"},
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
    {"ady": "Classic", "baha": 35.0, "surat": "assets/images/moijitos.jpg"},
    {"ady": "Berry", "baha": 35.0, "surat": "assets/images/moijitos.jpg"},
    {"ady": "Mango", "baha": 35.0, "surat": "assets/images/moijitos.jpg"},
    {"ady": "Kiwi", "baha": 35.0, "surat": "assets/images/moijitos.jpg"},
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
          itemCount: Suwlar.length,
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
                        image: AssetImage(Suwlar[index]["surat"]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${Suwlar[index]["baha"].toInt()} TMT",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      Suwlar[index]["ady"],
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Spacer(),
                  Consumer<CartProvider>(
                    builder: (context, cart, child) {
                      final itemInCart = cart.selectedItems.firstWhere(
                        (item) => item['ady'] == Suwlar[index]['ady'],
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
                                      Suwlar[index]['ady'],
                                      quantity - 1,
                                    );
                                  } else {
                                    cart.removeItem(Suwlar[index]['ady']);
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
                                    Suwlar[index]['ady'],
                                    quantity + 1,
                                  );
                                },
                              ),
                            ],
                          )
                          : OutlinedButton(
                            onPressed: () {
                              cart.addItem(Suwlar[index]);
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
