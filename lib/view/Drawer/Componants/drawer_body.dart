import 'package:flutter/material.dart';

import '../Widgets/drawer_item.dart';

class DrawerBody extends StatelessWidget {
  const DrawerBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DrawerItem(
          icon: Icons.history_outlined,
          text: "Order History",
          onTap: () {},
        ),
        DrawerItem(
          icon: Icons.location_on_outlined,
          text: "My Addresses",
          onTap: () {},
        ),
        DrawerItem(
          icon: Icons.credit_card_outlined,
          text: "My Cards",
          onTap: () {},
        ),
        DrawerItem(
          icon: Icons.airplane_ticket_outlined,
          text: "Vouchers",
          onTap: () {},
        ),
      ],
    );
  }
}
