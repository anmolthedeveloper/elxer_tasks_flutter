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
          color: primaryWhiteColor,
          padding: const EdgeInsets.symmetric(vertical: 18.0),
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
      ],
    );
  }
}
