import 'package:fello/Routes/routes.dart';
import 'package:fello/utils/constants/assets.dart';
import 'package:fello/utils/constants/color.dart';
import 'package:fello/utils/size/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/reusable/reusable_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fello'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
              ),
              child: Center(
                  child: SvgPicture.asset(
                AppImages.logo,
                width: 100,
              )),
            ),
            const ListTile(
              leading: Icon(Icons.home_filled),
              title: Text('Home'),
            ),
            const ListTile(
              leading: Icon(Icons.list_alt_rounded),
              title: Text('Selfie List'),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.logout_rounded),
              title: Text('Logout'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Today's Data Collection: 9",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            GridView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2.5,
                crossAxisSpacing: 12,
                mainAxisSpacing: 16,
              ),
              children: [
                ReusableWidgets.selectionContainer(
                  context: context,
                  onTap: () => Navigator.pushNamed(context, AppRoutes.home),
                  title: "Reports",
                  iconAssetName: AppImages.full,
                ),

              ],
            ),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
