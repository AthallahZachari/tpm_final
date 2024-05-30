import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {},
              style: IconButton.styleFrom(
                backgroundColor: Colors.grey[100],
                padding: const EdgeInsets.all(15),
              ),
              iconSize: 15,
              icon: const Icon(Icons.person_4_outlined),
            ),
            const SizedBox(width: 10),
            Text(
              "Hello There!",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            )
          ],
        ),
        IconButton(
          onPressed: () {},
          style: IconButton.styleFrom(
            backgroundColor: Colors.grey[100],
            padding: const EdgeInsets.all(15),
          ),
          iconSize: 15,
          icon: const Icon(Icons.notifications_outlined),
        ),
      ],
    );
  }
}