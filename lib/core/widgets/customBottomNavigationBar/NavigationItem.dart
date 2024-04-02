import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NavigationItem extends StatefulWidget {
  const NavigationItem({
    super.key,
    required this.icon,
    required this.color,
    required this.highlightColor,
    this.selected = false,
  });
  final bool selected;
  final IconData icon;
  final Color color;
  final Color highlightColor;

  @override
  State<NavigationItem> createState() => _NavigationItemState();
}

class _NavigationItemState extends State<NavigationItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            widget.icon,
            color: widget.selected ? widget.highlightColor : widget.color,
          ),
          const Gap(5.0),
          Opacity(
            opacity: widget.selected ? 1 : 0,
            child: Container(
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                color: widget.highlightColor,
                borderRadius: const BorderRadius.all(Radius.circular(100)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
