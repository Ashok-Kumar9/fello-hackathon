import 'dart:io';
import 'dart:ui';

import 'package:fello/screens/explore/explore.dart';
import 'package:fello/screens/home/home.dart';
import 'package:fello/screens/profile/profile.dart';
import 'package:fello/screens/refer/refer.dart';
import 'package:fello/screens/track/track.dart';
import 'package:fello/utils/constants/assets.dart';
import 'package:fello/utils/size/size.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'custom_navbar.dart';

class NavbarScreen extends StatefulWidget {
  const NavbarScreen({Key? key}) : super(key: key);

  @override
  State<NavbarScreen> createState() => _NavbarScreenState();
}

class _NavbarScreenState extends State<NavbarScreen>
    with TickerProviderStateMixin {
  final List<int> navigationBarIndexStackList = [];
  List<IconData> items = [
    FontAwesomeIcons.house,
    FontAwesomeIcons.eye,
    FontAwesomeIcons.camera,
    FontAwesomeIcons.shareFromSquare,
    FontAwesomeIcons.user
  ];

  List<IconData> items1 = [
    FontAwesomeIcons.house,
    FontAwesomeIcons.solidEye,
    FontAwesomeIcons.camera,
    FontAwesomeIcons.solidShareFromSquare,
    FontAwesomeIcons.solidUser
  ];

  int _currentIndex = 2;
  final List<int> _indexList = [];

  @override
  void initState() {
    super.initState();
  }

  void saveIndex(index) async {


    if (!_indexList.contains(_currentIndex)) {
      _indexList.add(_currentIndex);
    } else {
      _indexList.remove(_currentIndex);
      _indexList.add(_currentIndex);
    }
    if (_indexList.length > 4) _indexList.removeAt(0);

    setState(() {
      _currentIndex = index;
    });
  }

  void onPressed(int index) {
    saveIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (_indexList.isEmpty || _currentIndex == 0) {
          return Future.value(true);
        }
        _indexList.remove(_currentIndex);
        setState(() {
          _currentIndex = _indexList.removeLast();
        });
        return Future.value(false);
      },
      child: Scaffold(
        extendBody: true,
        body: _currentIndex == 0
            ? const HomeScreen()
            : _currentIndex == 1
                ? const TrackScreen()
                : _currentIndex == 2
                    ? const ExploreScreen()
                    : _currentIndex == 3
                        ? const ReferScreen()
                        : const ProfileScreen(),
        floatingActionButton: SizedBox(
          height: SizeConfig.height * 0.2,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CustomNavigationBar(
                iconSize: 20.0,
                selectedColor: Colors.green,
                strokeColor: Colors.white,
                unSelectedColor: Colors.white,
                borderRadius: const Radius.circular(18.0),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromRGBO(33, 87, 97, 1),
                    Color.fromRGBO(27, 77, 118, 1),
                    Color.fromRGBO(29, 49, 98, 1),
                  ],
                ),
                blurEffect: true,
                opacity: 1.0,
                items: List.generate(
                  items.length,
                  (index) => CustomNavigationBarItem(
                    icon: FaIcon(
                      index == _currentIndex ? items1[index] : items[index],
                    ),
                  ),
                ),
                currentIndex: _currentIndex,
                onTap: (index) => saveIndex(index),
                isFloating: true,
              ),
              Positioned(
                bottom: 26.0,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = 2;
                    });
                  },
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.all(Radius.circular(100.0)),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 5.0,
                        sigmaY: 10.0,
                      ),
                      child: Opacity(
                        opacity: 0.6,
                        child: Container(
                          height: 0.15 * (MediaQuery.of(context).size.width),
                          width: 0.15 * (MediaQuery.of(context).size.width),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.fromBorderSide(
                              BorderSide(
                                color: Colors.white.withOpacity(0.5),
                                width: 2.0,
                              ),
                            ),
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromRGBO(33, 87, 97, 1),
                                // Darker shade of the first color
                                Color.fromRGBO(27, 77, 118, 1),
                                // Darker shade of the second color
                                Color.fromRGBO(29, 49, 98, 1),
                                //
                              ],
                            ),
                          ),
                          child: Center(
                              child: Image.asset(
                            AppImages.logo,
                            height: 0.08 * (MediaQuery.of(context).size.width),
                            width: 0.08 * (MediaQuery.of(context).size.width),
                          )),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: Platform.isIOS
            ? FloatingActionButtonLocation.centerDocked
            : FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
