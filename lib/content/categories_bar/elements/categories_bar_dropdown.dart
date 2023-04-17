import 'package:flutter/material.dart';

class CategoryDropdown extends StatelessWidget {
  final String label;
  final Icon iconPath;
  const CategoryDropdown(
      {Key? key, required this.label, required this.iconPath})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xfff5f5f5),
      child: DropdownButton(
          itemHeight: 56,
          isExpanded: true,
          iconEnabledColor: const Color(0xff06d199),
          iconDisabledColor: const Color(0xff06d199),
          underline: DropdownButtonHideUnderline(
            child: Container(),
          ),
          icon: const SizedBox(
            width: 16,
            height: 56,
            child: Stack(
              children: [
                Positioned(
                  bottom: 16,
                  left: 0,
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 8,
                  ),
                ),
              ],
            ),
          ),
          items: [
            DropdownMenuItem(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xff06d199),
                        ),
                        child: IconButton(onPressed: null, icon: iconPath)),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      label,
                      style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.labelMedium!.fontSize,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
          onChanged: null),
    );
  }
}
