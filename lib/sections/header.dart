import 'package:flutter/material.dart';
import 'package:pointofsale_layout/sections/widgets/sync_status_dot.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Simons\'s BBQ Team',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
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
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 20,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Last Synced'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    spacing: 20,
                    children: [SyncStatusDot(), Text('3 mins ago')],
                  ),
                ],
              ),
              FilledButton.icon(
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 20,
                  ),
                ),
                onPressed: () {},
                label: const Text('Help'),
                icon: const Icon(Icons.help_outline),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
