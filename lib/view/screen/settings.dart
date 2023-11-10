import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/settings_controller.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SettingsController controller= Get.put(SettingsController());
    return SingleChildScrollView(
        padding: EdgeInsets.only(top: 50, left: 20.0, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/avatar_image.png'), // You can replace this with your avatar image
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Disable Notifications'),
              trailing: Switch(
                value: true, // You can set initial value for notifications here
                onChanged: (value) {
                  // Handle notification toggle
                },
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Address'),
              onTap: () {
                Get.toNamed(AppRoute.addressview);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About Us'),
              onTap: () {
                // Navigate to about us page
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text('Contact Us'),
              onTap: () {
                // Navigate to contact us page
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {
                controller.logout();
                // Perform logout
              },
            ),
          ],
        ),
      );
  }
}
