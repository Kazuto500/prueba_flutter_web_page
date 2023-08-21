import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final String sectionName;
  final Color sectionColor, labelColor, iconBackgroundColor, iconColor;
  final bool isRated;
  const ServiceCard({
    Key? key,
    required this.sectionName,
    required this.sectionColor,
    required this.labelColor,
    required this.iconBackgroundColor,
    required this.iconColor,
    required this.isRated,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    int securitySpace = (size.width > 680) ? 354 : 0;
    bool isVertical = false;

    if (size.width - securitySpace < 370 ||
        (size.width - securitySpace > 500 &&
            (size.width - securitySpace < 680))) {
      isVertical = true;
    }
    return ColoredBox(
      color: sectionColor,
      child: Stack(
        children: [
          if (isRated)
            Positioned(
              left: 16,
              top: 0,
              child: Container(
                color: Colors.red,
                padding: const EdgeInsets.all(4),
                child: Image.asset(
                  "/assets/lmpp.jpg",
                  width: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          isVertical
              ? Column(
                  children: [
                    Image.asset(
                      "assets/cpsc.jpeg",
                      width: double.infinity,
                      height: 140,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Text(
                              sectionName,
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .fontSize,
                                  fontWeight: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .fontWeight,
                                  color: labelColor),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4),
                                child: Material(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  color: iconBackgroundColor,
                                  child: IconButton(
                                    onPressed: null,
                                    icon: Icon(
                                      Icons.play_arrow_rounded,
                                      color: iconColor,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4),
                                child: Material(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  color: iconBackgroundColor,
                                  child: IconButton(
                                    onPressed: null,
                                    icon: Icon(
                                      Icons.check_box_outline_blank_rounded,
                                      color: iconColor,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4),
                                child: Material(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  color: iconBackgroundColor,
                                  child: IconButton(
                                    onPressed: null,
                                    icon: Icon(
                                      Icons.card_giftcard_rounded,
                                      color: iconColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: Image.asset(
                        "assets/cpsc.jpeg",
                        height: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Text(
                                sectionName,
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .fontSize,
                                    fontWeight: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .fontWeight,
                                    color: labelColor),
                              ),
                            ),
                            Wrap(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Material(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    color: iconBackgroundColor,
                                    child: IconButton(
                                      onPressed: null,
                                      icon: Icon(
                                        Icons.play_arrow_rounded,
                                        color: iconColor,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Material(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    color: iconBackgroundColor,
                                    child: IconButton(
                                      onPressed: null,
                                      icon: Icon(
                                        Icons.check_box_outline_blank_rounded,
                                        color: iconColor,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Material(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    color: iconBackgroundColor,
                                    child: IconButton(
                                      onPressed: null,
                                      icon: Icon(
                                        Icons.card_giftcard_rounded,
                                        color: iconColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
