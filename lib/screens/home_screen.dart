import 'package:hci_project/screens/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:hci_project/widgets/item_card.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:badges/badges.dart';

import './product_screen.dart';
import '../widgets/mydrawer.dart';
import '../widgets/cartdrawer.dart';
import '../provider/cart.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _sKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _sKey,
      appBar: AppBar(
        title: Text('Food Menu'),
        centerTitle: true,
        backgroundColor: Color(0xFF9B2E2E),
        actions: <Widget>[
          IconButton(
            icon: Badge(
              showBadge: Provider.of<Cart>(context).cartItems.length == 0
                  ? false
                  : true,
              badgeContent: Provider.of<Cart>(context).cartItems.length == 0
                  ? null
                  : Text(
                      Provider.of<Cart>(context).cartItems.length.toString()),
              badgeColor: Color(0xFFC7ECF2),
              child: Icon(
                Icons.shopping_cart,
              ),
            ),
            onPressed: () {
              _sKey.currentState.openEndDrawer();
            },
          ),
        ],
      ),
      drawer: MyDrawer(),
      endDrawer: CartDrawer(),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ItemCard(_sKey, 'Idli', '25'),
              ItemCard(_sKey, 'Dosa', '32'),
              ItemCard(_sKey, 'Sandwich', '45'),
              ItemCard(_sKey, 'Lemon Juice', '20'),
              ItemCard(_sKey, 'Tea', '12'),
              ItemCard(_sKey, 'Coffee', '15'),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
