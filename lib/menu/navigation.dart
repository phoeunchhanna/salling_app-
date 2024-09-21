import 'package:cart_app/screen/product_list.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {return Drawer(
      child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Menu'), 
              accountEmail: Text('Chhanna code @gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('https://yt3.googleusercontent.com/q2nFx6jFxMglU079agwvJSBYLpMlucM-z-XuNIfzDCKxIMwWgzXnBH0z_jkRhjdTf2hVmjWqTg=s900-c-k-c0x00ffffff-no-rj'),
                child: ClipOval(child: Image.network('https://yt3.googleusercontent.com/q2nFx6jFxMglU079agwvJSBYLpMlucM-z-XuNIfzDCKxIMwWgzXnBH0z_jkRhjdTf2hVmjWqTg=s900-c-k-c0x00ffffff-no-rj'),),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.connect_without_contact),
              title: Text('Connect'),
              onTap: () {
               
              },
            ),
            ListTile(
              leading: Icon(Icons.group_add),
              title: Text('Grups'),
              onTap: () {
                
              },
            ),
            ListTile(
              leading: Icon(Icons.production_quantity_limits),
              title: Text('Products'),
              onTap: () {
               
              },
            ),
            ListTile(
              leading: Icon(Icons.category),
              title: Text('Category'),
              onTap: () {
                
              },
            ),
            ListTile(
              leading: Icon(Icons.support),
              title: Text('Suppliers'),
              onTap: () {
                
              },
            ),
            ListTile(
              leading: Icon(Icons.report_gmailerrorred_outlined),
              title: Text('Reporting'),
              onTap: () {
               
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
               Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  ProductListPage(),
                  ),
                );
              },
            ),
          ],
        ),
    );return const Placeholder();
  }
}