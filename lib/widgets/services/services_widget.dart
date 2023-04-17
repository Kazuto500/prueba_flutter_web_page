import 'package:flutter/cupertino.dart';
import 'package:prueba_flutter_web_page/widgets/services/services_cards_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Services extends StatelessWidget {
  const Services({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    int securitySpace = (size.width > 680) ? 354 : 0;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: StaggeredGrid.count(
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        crossAxisCount: (size.width - securitySpace > 500) ? 2 : 1,
        children: const [
          ServiceCard(
            sectionName: "Logo Design",
            sectionColor: Color(0xff044a88),
            labelColor: Color(0xffffffff),
            iconBackgroundColor: Color(0xffffffff),
            iconColor: Color(0xff044a88),
            isRated: false,
          ),
          ServiceCard(
            sectionName: "Corporate Identity",
            sectionColor: Color(0xff4ce1b7),
            labelColor: Color(0xff044a88),
            iconBackgroundColor: Color(0xff044a88),
            iconColor: Color(0xff4ce1b7),
            isRated: false,
          ),
          ServiceCard(
            sectionName: "Influencer Guide",
            sectionColor: Color(0xff4ce1b7),
            labelColor: Color(0xff044a88),
            iconBackgroundColor: Color(0xff044a88),
            iconColor: Color(0xff4ce1b7),
            isRated: false,
          ),
          ServiceCard(
            sectionName: "Project Management",
            sectionColor: Color(0xff044a88),
            labelColor: Color(0xffffffff),
            iconBackgroundColor: Color(0xffffffff),
            iconColor: Color(0xff044a88),
            isRated: false,
          ),
          ServiceCard(
            sectionName: "Content Writer",
            sectionColor: Color(0xff414c5e),
            labelColor: Color(0xffffffff),
            iconBackgroundColor: Color(0xffffffff),
            iconColor: Color(0xff414c5e),
            isRated: false,
          ),
          ServiceCard(
            sectionName: "Experimental Illustration",
            sectionColor: Color(0xff4ce1b7),
            labelColor: Color(0xff044a88),
            iconBackgroundColor: Color(0xff044a88),
            iconColor: Color(0xff4ce1b7),
            isRated: false,
          ),
        ],
      ),
    );
  }
}
