import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
        SingleChildScrollView(
          scrollDirection: .horizontal,
          child: Row(
            spacing: 20,
            children: [
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
                  FilledButton.icon(
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 20,
                      ),
                    ),
                    onPressed: () {},
                    label: Text('Help'),
                    icon: Icon(Icons.help_outline),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
