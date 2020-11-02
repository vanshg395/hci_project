import 'package:hci_project/widgets/order_card.dart';
import 'package:flutter/material.dart';

import '../widgets/mydrawer.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders'),
        centerTitle: true,
        backgroundColor: Color(0xFF9B2E2E),
      ),
      drawer: MyDrawer(),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              OrderCard(
                '1',
                'DPS Boys Uniform',
                '25th October, 2020',
                '240',
                [
                  {'title': 'Dosa', 'qty': '5'},
                  {'title': 'Lemon Juice', 'qty': '4'},
                ],
              ),
              Divider(
                thickness: 2,
                indent: 16,
                endIndent: 16,
              ),
              OrderCard(
                '2',
                'NCERT Class XII Bundle',
                '6th October, 2020',
                '64',
                [
                  {'title': 'Dosa', 'qty': '2'}
                ],
              ),
              Divider(
                thickness: 2,
                indent: 16,
                endIndent: 16,
              ),
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
