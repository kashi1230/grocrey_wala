import 'package:flutter/material.dart';

import '../screens/Addproduct.dart';
import '../screens/BillingScreen.dart';
import '../screens/SettingScreen.dart';

class VendorDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Text('Vendor Menu'),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            title: Text('Add Products'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddProductScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Generate Bill'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BillingScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingScreen ()),
              );
            },
          ),
        ],
      ),
    );
  }
}
