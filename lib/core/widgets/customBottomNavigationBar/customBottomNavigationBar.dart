import 'package:elxer_tasks/core/theme/colors.dart';
import 'package:elxer_tasks/core/widgets/customBottomNavigationBar/NavigationItem.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar(
      {super.key, required this.onChange, required this.onPlusTap});
  final Function onChange;
  final VoidCallback onPlusTap;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 50),
          color: primaryWhiteColor,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                  widget.onChange(_selectedIndex);
                },
                child: NavigationItem(
                    selected: _selectedIndex == 0,
                    icon: Icons.home,
                    color: primaryGreenThemeColor.withOpacity(.6),
                    highlightColor: primaryGreenThemeColor),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                  widget.onChange(_selectedIndex);
                },
                child: NavigationItem(
                    selected: _selectedIndex == 1,
                    icon: Icons.bar_chart,
                    color: primaryGreenThemeColor.withOpacity(.6),
                    highlightColor: primaryGreenThemeColor),
              ),
              SizedBox(
                width: width * .15,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                  widget.onChange(_selectedIndex);
                },
                child: NavigationItem(
                    selected: _selectedIndex == 2,
                    icon: Icons.calendar_month,
                    color: primaryGreenThemeColor.withOpacity(.6),
                    highlightColor: primaryGreenThemeColor),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = 3;
                  });
                  widget.onChange(_selectedIndex);
                },
                child: NavigationItem(
                    selected: _selectedIndex == 3,
                    icon: Icons.settings,
                    color: primaryGreenThemeColor.withOpacity(.6),
                    highlightColor: primaryGreenThemeColor),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 25,
          child: GestureDetector(
            onTap: widget.onPlusTap,
            child: Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ],
                color: primaryGreenThemeColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(100.0),
                ),
              ),
              child: const Icon(
                Icons.add,
                color: primaryWhiteColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
