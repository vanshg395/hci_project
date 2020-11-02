import 'package:hci_project/screens/query_screen.dart';
import 'package:flutter/material.dart';
import 'package:hci_project/widgets/ticket_card.dart';

import '../widgets/mydrawer.dart';

class SupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tickets'),
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
                height: 30,
              ),
              TicketCard(
                '1',
                'Quality Not Good',
                'The food was very spicy and was not upto the mark. Expected quality from this restaurant is much higher. Please improve the food taste.',
                '25th October, 2020',
                'Open',
                'Complaint',
              ),
              Divider(
                thickness: 2,
                indent: 16,
                endIndent: 16,
              ),
              TicketCard(
                '2',
                'Payment Failed',
                'The portal was not accepting my card. My card was working everywhere except this portal. Please fix the issue.',
                '9th October, 2020',
                'Closed',
                'Payment',
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
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add),
        label: Text('New Ticket'),
        backgroundColor: Color(0xFF9B2E2E),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => QueryScreen(),
          ),
        ),
      ),
    );
  }
}
