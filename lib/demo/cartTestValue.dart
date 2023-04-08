import 'package:flutter/material.dart';
import 'package:uniqartapp/demo/shoppingCartPage.dart';

class ItemSelectionPage extends StatelessWidget {
  final List<CartItem> cartItems;
  final void Function(CartItem) addItemToCart;

  ItemSelectionPage({
    required this.cartItems,
    required this.addItemToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Items'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Item 1'),
            subtitle: Text('Price: \$10.00'),
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                final item = CartItem(
                  itemId: 'item1',
                  itemName: 'Item 1',
                  itemPrice: 10.00,
                  quantity: 1,
                );
               // addItemToCart(item);
                Navigator.pop(context);
              },
            ),
          ),
          ListTile(
            title: Text('Item 2'),
            subtitle: Text('Price: \$15.00'),
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                final item = CartItem(
                  itemId: 'item2',
                  itemName: 'Item 2',
                  itemPrice: 15.00,
                  quantity: 1,
                );
            //    addItemToCart(item);
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
