import 'package:flutter/material.dart';

class CommonAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppbar({super.key,
    required this.showBackArrow,
    required this.title});

  final bool showBackArrow;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
              children: [
                if (!showBackArrow)
                  const Icon(
                    Icons.menu,
                    color: Colors.black,
                    size: 30,
                  ),
                const SizedBox(width: 10,),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]

          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset('assets/images/profile.jpg',
              fit: BoxFit.cover,
              width: 40,
              height: 40,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
