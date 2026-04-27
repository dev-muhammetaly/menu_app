import 'package:flutter/material.dart';
import 'package:menuu/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class Sargytlarym extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, _) {
        final cartItems = cartProvider.selectedItems;

        return Scaffold(
          appBar: AppBar(
            title: Text("Sargytlaryň"),
            actions: [
              if (cartItems.isNotEmpty)
                IconButton(
                  icon: Icon(Icons.delete_sweep),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder:
                          (ctx) => AlertDialog(
                            title: Text("Sebedi arassalamak"),
                            content: Text(
                              "Siz ähli harytlary pozmak isleýäňizmi?",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(ctx).pop(),
                                child: Text("Ýok"),
                              ),
                              TextButton(
                                onPressed: () {
                                  cartProvider.clearCart();
                                  Navigator.of(ctx).pop();
                                },
                                child: Text("Hawa"),
                              ),
                            ],
                          ),
                    );
                  },
                ),
            ],
          ),
          body:
              cartItems.isEmpty
                  ? Center(child: Text("Sebet boş"))
                  : Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: cartItems.length,
                          itemBuilder: (context, index) {
                            final item = cartItems[index];
                            final itemId = item['ady'];
                            final quantity = item['quantity'] ?? 1;
                            final price = item['baha'] as double;
                            final itemTotal = price * quantity;

                            return Dismissible(
                              key: Key(itemId),
                              background: Container(
                                color: Colors.red,
                                alignment: Alignment.centerRight,
                                padding: EdgeInsets.only(right: 20),
                                child: Icon(Icons.delete, color: Colors.white),
                              ),
                              direction: DismissDirection.endToStart,
                              onDismissed: (direction) {
                                cartProvider.removeItem(itemId);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Haryt pozuldy"),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                              },
                              child: Card(
                                margin: EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 5,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        contentPadding: EdgeInsets.zero,
                                        leading: Container(
                                          width: 60,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                            image: DecorationImage(
                                              image: AssetImage(item['surat']),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        title: Text(
                                          item['ady'],
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        subtitle: Text(
                                          '${price.toStringAsFixed(2)} TMT',
                                        ),
                                        trailing: IconButton(
                                          icon: Icon(Icons.delete),
                                          onPressed: () {
                                            cartProvider.removeItem(itemId);
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text("Haryt pozuldy"),
                                                duration: Duration(seconds: 1),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          // Quantity control
                                          Row(
                                            children: [
                                              IconButton(
                                                icon: Icon(
                                                  Icons.remove_circle_outline,
                                                ),
                                                onPressed: () {
                                                  cartProvider
                                                      .decrementQuantity(
                                                        itemId,
                                                      );
                                                },
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                  vertical: 5,
                                                ),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.grey,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Text(
                                                  quantity.toString(),
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                icon: Icon(
                                                  Icons.add_circle_outline,
                                                ),
                                                onPressed: () {
                                                  cartProvider
                                                      .incrementQuantity(
                                                        itemId,
                                                      );
                                                },
                                              ),
                                            ],
                                          ),
                                          // Item total price
                                          Text(
                                            'Jemi: ${itemTotal.toStringAsFixed(2)} TMT',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      if (cartItems.isNotEmpty)
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withValues(alpha: 0.5),
                                spreadRadius: 1,
                                blurRadius: 10,
                                offset: Offset(0, -3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Harytlaryň sany:",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    "${cartItems.length}",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Divider(thickness: 1),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Jemi töleg:",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "${cartProvider.totalAmount.toStringAsFixed(2)} TMT",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                            ],
                          ),
                        ),
                    ],
                  ),
        );
      },
    );
  }
}
