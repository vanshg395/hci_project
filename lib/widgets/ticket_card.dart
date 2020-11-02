import 'package:flutter/material.dart';

class TicketCard extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final String date;
  final String status;
  final String type;

  TicketCard(
      this.id, this.title, this.description, this.date, this.status, this.type);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ticket #$id',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          Text(
            description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Wrap(
            spacing: 10,
            children: [
              Chip(
                label: Text(
                  status,
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: status == 'Closed' ? Colors.green : Colors.red,
              ),
              Chip(
                label: Text(
                  type,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
