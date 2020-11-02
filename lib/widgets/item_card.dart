import 'package:flutter/material.dart';
import 'package:hci_project/provider/cart.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatefulWidget {
  @override
  _ItemCardState createState() => _ItemCardState();

  final GlobalKey<ScaffoldState> sKey;
  final String title;
  final String price;

  ItemCard(this.sKey, this.title, this.price);
}

class _ItemCardState extends State<ItemCard> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(widget.title),
            subtitle: Text('₹ ${widget.price}/-'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  child: Icon(
                    Icons.remove,
                    size: 20,
                  ),
                  onTap: () {
                    if (_count == 0) {
                      return;
                    }
                    setState(() {
                      _count--;
                    });
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '$_count',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  child: Icon(
                    Icons.add,
                    size: 20,
                  ),
                  onTap: () {
                    setState(() {
                      _count++;
                    });
                  },
                ),
              ],
            ),
          ),
          GestureDetector(
            child: Container(
              height: 50,
              width: 250,
              margin: EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                color: _count == 0
                    ? Color(0xFF9B2E2E).withOpacity(0.5)
                    : Color(0xFF9B2E2E),
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Text(
                'Add to Cart',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            onTap: _count == 0
                ? null
                : () {
                    Provider.of<Cart>(context, listen: false)
                        .addToCart(widget.title, widget.price, _count);
                    widget.sKey.currentState.showSnackBar(
                      SnackBar(
                        content: Text('Item Added to Cart'),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                    setState(() {
                      _count = 0;
                    });
                  },
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            indent: 16,
            endIndent: 16,
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
