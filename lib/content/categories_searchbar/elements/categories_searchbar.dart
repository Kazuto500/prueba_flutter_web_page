import 'package:flutter/material.dart';

class CategoriesSearchBar extends StatelessWidget {
  const CategoriesSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xff33ddae),
      child: Stack(
        children: [
          Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 400),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                child: Material(
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 40,
                        color: const Color.fromARGB(255, 175, 175, 175),
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('See All'),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                    Icons.keyboard_arrow_down_rounded)),
                          ],
                        )),
                      ),
                      Container(
                        width: 268,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blueGrey.withOpacity(0.3),
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          border: Border.all(
                            color: Colors.blueGrey.withOpacity(0.5),
                            width: 2,
                          ),
                          color: Colors.white,
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 10,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
