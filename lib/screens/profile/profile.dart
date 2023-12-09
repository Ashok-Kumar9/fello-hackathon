import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                height: 100,
                width: 100,
                fit: BoxFit.cover,
                "https://img.etimg.com/thumb/msid-56165978,width-300,height-225,imgsize-213620,,resizemode-75/virat_bccl.jpg",
              ),
            ),
            const SizedBox(height: 8),

             Text(
              "Virat Kohli",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.info_outline_rounded,
                  color: Colors.grey,
                  size: 16,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'Not Verified',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                )
              ],
            ),
            const Divider(
              color: Colors.grey,
              thickness: 0.3,
            ),
            const ListTileCustom(
              title: ('Account Info and KYC'),
              subtitle: ('Manage account information'),
              iconData: Icons.person_2_outlined,
            ),
            const ListTileCustom(
              title: ('Gift Cards'),
              subtitle: ('Access all your gift cards'),
              iconData: Icons.card_giftcard_outlined,
            ),
            const ListTileCustom(
              title: ('Transactions'),
              subtitle: ('You can view all your payments here'),
              iconData: Icons.payment,
            ),
            const ListTileCustom(
              title: ('Settings'),
              subtitle: ('Manage app settings'),
              iconData: Icons.settings,
            ),
            const ListTileCustom(
              title: ('Support'),
              subtitle: ('FAQs, Contact Blance'),
              iconData: Icons.support_agent_rounded,
            ),
            const SizedBox(height: 8),
            // logout button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Logout'),
                ),
              ),
            ),
            const SizedBox(height: 8)
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
      ),
    );
  }
}

class ListTileCustom extends StatelessWidget {
  const ListTileCustom({
    super.key,
    required,
    required this.title,
    required this.subtitle,
    required this.iconData,
  });

  final String title;
  final String subtitle;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListTile(
        leading: const Icon(Icons.person_2_outlined, color: Color(0xfff5fcf8)),
        tileColor: const Color(0xff17181b),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Text(
          title,
          style: const TextStyle(color: Color(0xfff5fcf8)),
        ),
        subtitle: Text(subtitle),
      ),
    );
  }
}
