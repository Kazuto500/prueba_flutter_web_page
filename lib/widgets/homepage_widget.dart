import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_flutter_web_page/data/controllers/session_controller.dart';
import 'package:prueba_flutter_web_page/ui/lateral_menu/lateral_menu_widget.dart';
import 'package:prueba_flutter_web_page/ui/content_panel/boxes/content_section_widget.dart';

class HomePage extends StatelessWidget {
  final ImageProvider<Object> _userImage;
  const HomePage({Key? key, required String userImageUrl})
      : _userImage = const AssetImage('assets/lmpp.jpg'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 100,
            child: Image.asset(
              "assets/logo.jpg",
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.language,
              color: Colors.blueGrey,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Seleccione un idioma'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          child: const Text('Español'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        const Padding(padding: EdgeInsets.all(10)),
                        ElevatedButton(
                          child: const Text('Inglés'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
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
                margin: const EdgeInsets.symmetric(horizontal: 10),
                constraints: const BoxConstraints(maxWidth: 200, maxHeight: 40),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          const Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search...',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal: 10,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: double.infinity,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                              color: Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                        color: Colors.transparent,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.search),
                        color: Colors.blueGrey,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.chat,
                      color: Colors.blueGrey,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.mail,
                      color: Colors.blueGrey,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.notifications,
                      color: Colors.blueGrey,
                    ),
                    onPressed: () {},
                  ),
                  CircleAvatar(
                    backgroundImage: _userImage,
                  ),
                  Consumer<SessionController>(
                    builder: (context, sessionController, child) =>
                        PopupMenuButton(
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.blueGrey,
                      ),
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<dynamic>>[
                        // PopupMenuItem(
                        //   child: ListTile(
                        //     leading: CircleAvatar(
                        //       backgroundImage: _userImage,
                        //     ),
                        //     title: const Text('Usuario'),
                        //     onTap: () {},
                        //   ),
                        // ),
                        // const PopupMenuDivider(),
                        // ...[
                        //   'Opción 1',
                        //   'Opción 2',
                        // ]
                        //     .map((String option) => PopupMenuItem(
                        //           child: Text(option),
                        //         ))
                        //     .toList(),
                        PopupMenuItem(
                          child: Text('Log out'),
                          onTap: () {
                            sessionController.logout(
                              onSuccess: () {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    "landing", (route) => false);
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Row(
          children: [
            if (size.width > 680) const LateralMenu(),
            const ContentSection(),
          ],
        ),
      ),
      drawer: (size.width < 680) ? const LateralMenu() : null,
    );
  }
}
