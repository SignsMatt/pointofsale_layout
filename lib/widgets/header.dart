import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        spacing: 20,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  'Simons\'s BBQ Team',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight(700)),
                  overflow: TextOverflow.fade,
                  softWrap: false,
                ),
                Text(
                  'Location ID#: SIMON123',
                  overflow: TextOverflow.fade,
                  softWrap: false,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: .end,
            children: [
              Text('Last Synced'),
              Row(
                mainAxisAlignment: .end,
                spacing: 20,
                children: [
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Text('3 mins ago'),
                ],
              ),
            ],
          ),
          Column(
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.all(Radius.circular(10)),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  elevation: 0,
                ),
                onPressed: () {},
                label: Text('Help'),
                icon: Icon(Icons.help_outline),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
