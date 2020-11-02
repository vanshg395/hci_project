import 'package:flutter/material.dart';
import 'package:hci_project/widgets/dropdown.dart';

import '../widgets/mydrawer.dart';

class QueryScreen extends StatefulWidget {
  @override
  _QueryScreenState createState() => _QueryScreenState();
}

class _QueryScreenState extends State<QueryScreen> {
  String _type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Ticket'),
        centerTitle: true,
        backgroundColor: Color(0xFF9B2E2E),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Ask Us Here!',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Subject',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Description',
                  ),
                  maxLines: 5,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: MultilineDropdownButtonFormField(
                  isExpanded: true,
                  items: [
                    DropdownMenuItem(
                      child: Text(
                        'Support',
                        softWrap: false,
                      ),
                      value: 'Support',
                    ),
                    DropdownMenuItem(
                      child: Text(
                        'Payment',
                        softWrap: false,
                      ),
                      value: 'Payment',
                    ),
                    DropdownMenuItem(
                      child: Text(
                        'Complaint',
                        softWrap: false,
                      ),
                      value: 'Complaint',
                    ),
                    DropdownMenuItem(
                      child: Text(
                        'Other',
                        softWrap: false,
                      ),
                      value: 'Other',
                    ),
                  ],
                  value: _type,
                  iconSize: 30,
                  icon: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Icon(Icons.keyboard_arrow_down),
                  ),
                  onChanged: (val) {
                    setState(() {
                      _type = val;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Sample Policy',
                  ),

                  // validator: (value) {
                  //   if (value == null) {
                  //     return 'This field is required.';
                  //   }
                  // },
                  // onSaved: (value) {
                  //   _data['identity_choice'] = value;
                  // },
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: GestureDetector(
                  child: Container(
                    color: Colors.black,
                    alignment: Alignment.center,
                    height: 60,
                    width: 300,
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
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
