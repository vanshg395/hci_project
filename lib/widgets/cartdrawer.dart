import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart.dart';

class CartDrawer extends StatefulWidget {
  @override
  _CartDrawerState createState() => _CartDrawerState();
}

class _CartDrawerState extends State<CartDrawer> {
  String _cartTotal = '0';

  @override
  void initState() {
    super.initState();
    final _total = Provider.of<Cart>(context, listen: false).cartTotal();
    setState(() {
      _cartTotal = _total.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        bottom: false,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 100,
                alignment: Alignment.center,
                width: double.infinity,
                color: Color(0xFF9B2E2E),
                child: Text(
                  'Cart',
                  style: Theme.of(context).textTheme.headline5.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                ),
              ),
              if (Provider.of<Cart>(context).cartItems.length == 0) ...[
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    'No Items',
                    style: Theme.of(context).textTheme.headline5.copyWith(
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ),
              ] else ...[
                Expanded(
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: <Widget>[
                      ...Provider.of<Cart>(context)
                          .cartItems
                          .map(
                            (item) => ListTile(
                              title: Text(item['title']),
                              subtitle: Text('₹ ' + item['price'] + '/-'),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('x${item['qty']}'),
                                  IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                    onPressed: () async {
                                      bool _isConfirmed = false;
                                      await showDialog(
                                        context: context,
                                        child: AlertDialog(
                                          title: Text('Confirm'),
                                          content: Text(
                                              'Are you sure that you want to remove ${item['title']} from the cart?'),
                                          actions: [
                                            FlatButton(
                                              onPressed: () {
                                                _isConfirmed = true;
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('YES'),
                                            ),
                                            FlatButton(
                                              onPressed: () {
                                                _isConfirmed = false;
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('NO'),
                                            )
                                          ],
                                        ),
                                      );
                                      if (_isConfirmed)
                                        Provider.of<Cart>(context,
                                                listen: false)
                                            .deleteItem(item['title']);
                                    },
                                  )
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Subtotal',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontWeight: FontWeight.w300),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    '₹ $_cartTotal',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                InkWell(
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    margin: EdgeInsets.all(20),
                    alignment: Alignment.center,
                    color: Color(0xFF9B2E2E),
                    child: Text(
                      'Checkout',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
