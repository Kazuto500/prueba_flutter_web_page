import 'package:flutter/material.dart';

class TopBarButton extends StatelessWidget {
  final String iconRoute, name;
  final bool isSelected;
  const TopBarButton(
      {Key? key,
      required this.iconRoute,
      required this.name,
      required this.isSelected})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: InkWell(
        child: Column(
          children: [
            Image.asset(
              iconRoute,
              width: 34,
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.labelSmall!.fontSize,
                letterSpacing: 0.25,
                fontWeight: FontWeight.w500,
                color: isSelected
                    ? const Color(0xff06d199)
                    : const Color(0xffaaaaaa),
              ),
            )
          ],
        ),
      ),
    );
  }
}
