import 'package:fello/utils/size/size.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/assets.dart';

class TrackScreen extends StatelessWidget {
  const TrackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              AppImages.logo,
              height: SizeConfig.height * 0.1,
            ),
          ),
          const Center(
            child: Text('Track Screen'),
          ),
        ],
      ),
    );
  }
}
