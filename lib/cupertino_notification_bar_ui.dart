library cupertino_notification_bar_ui;

import "package:flutter/material.dart";

class StackedList extends StatefulWidget {
  StackedList({
    required this.children,
    this.dismissDirection = DismissDirection.startToEnd,
    this.verticalDelta = 13,
    this.scaleFactor = 20,
    this.animationDuration = 200,
    super.key,
  }) : assert(children.isNotEmpty);

  /// List containing all the widgets to be showed as part of stacked UI
  /// this cannot be null
  final List<Widget> children;

  /// Vertical factor for gap between `StackedListItem`
  /// defaults to 13. Higher the value, more the gap.
  final double verticalDelta;

  /// Scale factor for undelying `StackedListItem`
  /// defaults to 20. More the value, more it scales down.
  final double scaleFactor;

  /// Direction of dismiss, defaults to Left to Right (`startToEnd`)
  final DismissDirection dismissDirection;

  /// New item animation duration
  final int animationDuration;

  @override
  State<StackedList> createState() => _StackedListState();
}

class _StackedListState extends State<StackedList> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
          alignment: Alignment.center,
          children: widget.children
              .map((element) {
                final index = widget.children.indexOf(element);
                return AnimatedPositioned(
                  duration: Duration(milliseconds: widget.animationDuration),
                  top: 200 + (index * widget.verticalDelta),
                  left: 0,
                  right: 0,
                  child: AnimatedScale(
                    duration:
                        Duration(milliseconds: widget.animationDuration + 50),
                    scale: index <= 4
                        ? 1 - (index * index / widget.scaleFactor)
                        : 0,
                    child: Dismissible(
                        direction: widget.dismissDirection,
                        key: UniqueKey(),
                        onDismissed: (DismissDirection direction) {
                          return setState(() {
                            widget.children.removeAt(index);
                          });
                        },
                        child: element),
                  ),
                );
              })
              .toList()
              //using reversed list as Stack works on Last-Come-First-Out
              .reversed
              .toList()),
    );
  }
}

class StackedListItem extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  StackedListItem({
    super.key,
    required this.title,
    this.leading,
    this.onTapFunction,
    this.titleStyle,
    this.trailing,
    this.subtitle,
    this.isThreeLine = false,
    this.borderWidth = 2,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.white30,
  });

  /// leading image
  final Widget? leading;

  /// set this to true if you will be using subtitle, defaults to false
  final bool isThreeLine;

  /// callback function, defaults null
  final void Function()? onTapFunction;

  /// title or main content of tile
  final String title;

  /// styling for title, defaults to null
  final TextStyle? titleStyle;

  /// trailing content
  final Widget? trailing;

  /// subtitle widget, set `isThreeLine` to true
  final Widget? subtitle;

  /// background color for the widget
  final Color backgroundColor;

  final Color borderColor;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: borderWidth, color: borderColor),
      ),
      child: ListTile(
        leading: leading,
        isThreeLine: isThreeLine,
        onTap: onTapFunction,
        title: Text(
          title,
          style: titleStyle,
        ),
        trailing: trailing,
        subtitle: subtitle,
      ),
    );
  }
}
