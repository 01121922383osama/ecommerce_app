import 'package:flutter/material.dart';

class BuildAppBarHome extends StatelessWidget {
  const BuildAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      flexibleSpace: Container(
        margin: const EdgeInsets.only(left: 5, right: 5),
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.black,
            child: IconButton(
              color: Colors.white,
              onPressed: () {},
              icon: const Icon(Icons.menu),
            ),
          ),
          trailing: const CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 30,
            backgroundImage: NetworkImage(
              'https://i.pravatar.cc/300',
            ),
          ),
        ),
      ),
    );
  }
}
