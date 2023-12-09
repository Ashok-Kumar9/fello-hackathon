import 'package:flutter/material.dart';

import '../../utils/constants/assets.dart';
import '../../utils/size/size.dart';

class ReferScreen extends StatefulWidget {
  const ReferScreen({super.key});

  @override
  State<ReferScreen> createState() => _ReferScreenState();
}

class _ReferScreenState extends State<ReferScreen> {
  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
      body:
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
            child: Text('Refer Screen'),
          ),
        ],
      ),

    );
  }
}
