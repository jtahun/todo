import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson17/constants/theme_constants.dart';
import 'package:lesson17/screens/profile_screen.dart';

import '../widgets/nav_bar.dart';
import 'calendar_screen.dart';
import 'focus_screen.dart';
import 'home_screen.dart';



class AppScreen extends StatelessWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return DefaultTabController(
         length: 4,
         child: Scaffold(
          body: Stack(
            alignment: Alignment.bottomCenter,
            children:  [
             const Positioned(
                top:0,
                bottom:100,
                left: 0,
                right: 0,
                child: TabBarView(
                  children: [
                    HomeScreen(),
                    CalendarScreen(),
                    FocusScreen(),
                    ProfileScreen(),
                  ],
                ),
              ),
             const Positioned(
                  left: 0,
                  right: 0,
                  height: 100,
                  bottom: 0 ,
                  child: NavBar(),
              ),
               Positioned(
                 bottom: 68,
                  child: GestureDetector(
                    onTap: (){},
                    child: Container(
                        width:64,
                        height:64,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ThemeColors.primary
                        ),
                      alignment: Alignment.center,
                      child: SvgPicture.asset('assets/images/add.svg'),

                    ),
                  ),

              )
            ],
          ),
         ),
     );
    // return DefaultTabController();
  }
}

