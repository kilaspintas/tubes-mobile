import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatelessWidget{
  final padding = EdgeInsets.symmetric(horizontal: 20);



  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              accountName: Text('Rysa Laksana'),
              accountEmail: Text("rysalaksana@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  "https://avatarfiles.alphacoders.com/280/thumb-280958.png",
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
                ),
              ),
            decoration: BoxDecoration(
              color: Colors.amber,
              image: DecorationImage(
                image: NetworkImage(
                  "https://images.alphacoders.com/116/thumb-1920-1169181.jpg",
                ),
                fit: BoxFit.cover,
              )
            ),
            ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text("Favorites"),
            onTap: () =>null,
          ),
        ],
      ),
    );
  }
}

