import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:house_rent_web/constants.dart';
import 'package:house_rent_web/responsive.dart';
import 'components/change_button.dart';
import 'components/closer_location.dart';
import 'components/rent_image.dart';
import 'components/rent_info_with_icon.dart';
import 'components/result_list.dart';

class HomeScreen extends StatelessWidget {

  final String _description =
  '''
  모던한 외관의 스페인 Noa House는 집주인의 확고한 신념으로 만들어진 주택이라합니다. 편안한 분위기와 효율적인 구조를 1번으로 집과 정원사이를 자연스럽게 연결하길 희망했다는데 가족들을 위하는 가장의 마음이 느껴지는 설계입니다.
  복잡하지 내부 인테리는 원목의 질감과 화이트를 조화롭게 구성하였는데, 컨츄리하면서 현대적이 마감의 포인트 인테리어가 완성도를 높여주었습니다. 덕분에 시선은 분산되지 않으며 넓은 창으로 보이는 외부 정원은 답답합을 업애주었습니다.
''';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if(!Responsive.isMobile(context))
          Expanded(
            flex: 6,
            child: Row(
              children: [
                Expanded(
                  child: RentImage(),
                ),
                Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(top: defaultPadding),
                      child: Column(
                          children: [
                            ChangeButton(),
                            Padding(
                              padding: EdgeInsets.all(defaultPadding),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "\$15,000 / Year",
                                    style: Theme.of(context).textTheme.headline4!.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22
                                    ),
                                  ),
                                  SizedBox(height: defaultPadding / 2,),
                                  Text(
                                      "편안함을 위한 노력, 눈으로 향이 느껴지는 집",
                                    style: Theme.of(context).textTheme.headline5
                                  ),
                                  SizedBox(height: defaultPadding / 2,),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: RentInfoWithIcon(title: "침실",subTitle: "4", icon: Icons.king_bed_rounded,)
                                      ),
                                      Expanded(
                                          child: RentInfoWithIcon(title: "화장실",subTitle: "2", icon: Icons.bathtub_rounded)
                                      ),
                                      Expanded(
                                          child: RentInfoWithIcon(title: "면적",subTitle: "121평",)
                                      )
                                    ],
                                  ),
                                  SizedBox(height: defaultPadding,),
                                  Text(
                                    "상세 설명",
                                    style: Theme.of(context).textTheme.subtitle1,
                                  ),
                                  SizedBox(height: defaultPadding / 2,),
                                  Text(
                                    _description,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: Colors.grey
                                    ),
                                  ),
                                  SizedBox(height: defaultPadding,),
                                  Text(
                                      "교통 정보",
                                    style: Theme.of(context).textTheme.subtitle1,
                                  ),
                                  SizedBox(height: defaultPadding / 2,),
                                  CloserLocation(iconData: Icons.train_outlined, description: "인하대역", distance: 0.5,),
                                  SizedBox(height: defaultPadding / 2,),
                                  CloserLocation(iconData: Icons.school_outlined, description: "인하대학교", distance: 1.5,)
                                ],
                              ),
                            )
                          ],
                        ),
                    ),
                    )
              ],
            ),
          ),
        Expanded(
            flex: 5,
            child: ResultList()
        )
      ],
    );
  }
}




