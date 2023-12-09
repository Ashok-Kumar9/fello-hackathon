import 'package:fello/utils/constants/assets.dart';
import 'package:fello/utils/size/size.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SafeArea(
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const <Widget>[
              ListTile(
                leading: Icon(Icons.home_filled),
                title: Text('Profile'),
              ),
              ListTile(
                leading: Icon(Icons.list_alt_rounded),
                title: Text('KYC Details'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  AppImages.logo,
                  height: SizeConfig.height * 0.1,
                ),
              ),
              const Center(
                child: Text('Home Screen'),
              ),
            ],
          ),
          Positioned(
            top: SizeConfig.height * 0.05,
            left: 0,
            child: IconButton(
              icon: const Icon(
                Icons.menu,
                size: 36.0,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
        ],
      ),
    );
  }
}
