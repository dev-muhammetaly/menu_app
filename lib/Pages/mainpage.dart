import 'package:flutter/material.dart';
import 'package:menuu/Pages/Corbalar.dart';
import 'package:menuu/Pages/Salatlar.dart';
import 'package:menuu/Pages/Suwlar.dart';
import 'package:menuu/Pages/sargytlarym.dart';
import 'package:menuu/Pages/suwgornusleri/coffeez.dart';
import 'package:menuu/Pages/suwgornusleri/freshiez.dart';
import 'package:menuu/Pages/suwgornusleri/icedCofeez.dart';
import 'package:menuu/Pages/suwgornusleri/lemonadez.dart';
import 'package:menuu/Pages/suwgornusleri/mojitos.dart';
import 'package:menuu/Pages/suwgornusleri/shakez.dart';
import 'package:menuu/Pages/suwgornusleri/smoothiez.dart';
import 'package:menuu/Pages/suwgornusleri/teaz.dart';
import 'package:menuu/core/colors.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  String selectedCategory = "Hemmesi";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Menu'),
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Sargytlarym()),
                );
              },
            ),
          ],
        ),
        body: Column(
          children: [
            TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              indicatorColor: AllColors.systemcolor,
              tabs: [
                Tab(text: 'Salatlar'),
                Tab(text: 'Corbalar'),
                Tab(text: 'Suwlar'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Center(child: Salatlar()),

                  Center(child: Corbalar()),

                  Center(
                    child: Column(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedCategory =
                                          "Hemmesi"; // Show all drinks
                                    });
                                  },
                                  child: Text("Hemmesi"),
                                ),
                                SizedBox(width: 10),
                                OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedCategory =
                                          "Coffeez"; // Show Coffeez drinks
                                    });
                                  },
                                  child: Text("Coffeez"),
                                ),
                                SizedBox(width: 10),
                                OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedCategory =
                                          "Iced coffeez"; // Show Iced Coffeez drinks
                                    });
                                  },
                                  child: Text("Iced coffeez"),
                                ),
                                SizedBox(width: 10),
                                OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedCategory =
                                          "Teaz"; // Show Teaz drinks
                                    });
                                  },
                                  child: Text("Teaz"),
                                ),
                                SizedBox(width: 10),
                                OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedCategory =
                                          "Lemonadez"; // Show Lemonadez drinks
                                    });
                                  },
                                  child: Text("Lemonadez"),
                                ),
                                SizedBox(width: 10),
                                OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedCategory =
                                          "Smoothiez"; // Show Smoothiez drinks
                                    });
                                  },
                                  child: Text("Smoothiez"),
                                ),
                                SizedBox(width: 10),
                                OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedCategory =
                                          "Shakez"; // Show Shakez drinks
                                    });
                                  },
                                  child: Text("Shakez"),
                                ),
                                SizedBox(width: 10),
                                OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedCategory =
                                          "Mojitos"; // Show Mojitos drinks
                                    });
                                  },
                                  child: Text("Mojitos"),
                                ),
                                SizedBox(width: 10),
                                OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedCategory =
                                          "Freshiez"; // Show Freshiez drinks
                                    });
                                  },
                                  child: Text("Freshiez"),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Display drinks based on selected category
                        selectedCategory == "Hemmesi"
                            ? Expanded(child: Suwlar())
                            : Expanded(
                              child: _getCategoryView(selectedCategory),
                            ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getCategoryView(String category) {
    switch (category) {
      case "Coffeez":
        return Center(child: Coffeez());
      case "Iced coffeez":
        return Center(child: Icedcofeez());
      case "Teaz":
        return Center(child: Teaz());
      case "Lemonadez":
        return Center(child: Lemonadez());
      case "Smoothiez":
        return Center(child: Smoothiez());
      case "Shakez":
        return Center(child: Shakez());
      case "Mojitos":
        return Center(child: Mojitos());
      case "Freshiez":
        return Center(child: Freshiez());
      default:
        return Center(child: Text("gg"));
    }
  }
}
