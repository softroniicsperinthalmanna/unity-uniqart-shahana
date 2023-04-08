import 'package:flutter/material.dart';

class ShoppingCartPage extends StatefulWidget {
  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  List<CartItem> cartItems = [];

  void addItemToCart(CartItem item) {
    setState(() {
      cartItems.add(item);
    });
  }

  void removeItemFromCart(CartItem item) {
    setState(() {
      cartItems.remove(item);
    });
  }

  void clearCart() {
    setState(() {
      cartItems.clear();
    });
  }

  double getCartTotal() {
    double total = 0.0;
    for (CartItem item in cartItems) {
      total += item.itemPrice * item.quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final item = cartItems[index];
          return ListTile(
            title: Text(item.itemName),
            subtitle: Text('Price: ${item.itemPrice}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    if (item.quantity == 1) {
                      removeItemFromCart(item);
                    } else {
                      setState(() {
                        item.quantity--;
                      });
                    }
                  },
                ),
                Text('${item.quantity}'),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      item.quantity++;
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        height: 60.0,
        color: Colors.grey[200],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Total: \$${getCartTotal()}'),
            TextButton(
              onPressed: () {
                clearCart();
              },
              child: Text('Clear Cart'),
            ),
            TextButton(
              onPressed: () {
                // Do something to proceed to checkout
              },
              child: Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItem {
  final String itemId;
  final String itemName;
  final double itemPrice;
  int quantity;

  CartItem({
    required this.itemId,
    required this.itemName,
    required this.itemPrice,
    required this.quantity,
  });
}
