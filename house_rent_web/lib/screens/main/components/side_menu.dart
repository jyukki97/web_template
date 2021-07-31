import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:house_rent_web/custom/custom_range_thumb_shape.dart';
import 'package:house_rent_web/screens/main/components/properties.dart';
import '../../../constants.dart';
import 'amenities.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<dynamic> _propertyName = [
      {
        "name": "House",
        "icon": Icons.home
      },
      {
        "name": "Commercial",
        "icon": Icons.home_work_rounded
      },
      {
        "name": "Apartment",
        "icon": Icons.apartment_rounded
      },
      {
        "name": "Land Plot",
        "icon": Icons.landscape_rounded
      },
    ];

    return Drawer(
      elevation: 0,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("구조", style: Theme
                .of(context)
                .textTheme
                .headline6,),
            SizedBox(height: defaultPadding / 2,),
            Wrap(
              spacing: defaultPadding,
              runSpacing: defaultPadding,
              children: [
                for(var i = 0; i < 4; i++)
                  Container(
                    width: 120,
                    height: 100,
                    alignment: Alignment.bottomCenter,
                    color: i == 0 ? Colors.white : mainColor.withOpacity(0.1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(_propertyName[i]["icon"], size: 50, color: mainColor,),
                        SizedBox(height: defaultPadding / 2,),
                        Text(
                          _propertyName[i]["name"],
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey
                          ),
                        ),
                      ],
                    ),
                  )
              ],
            ),
            SizedBox(height: defaultPadding / 2,),
            Text("월세", style: Theme
                .of(context)
                .textTheme
                .headline6,),
            CustomSlider(),
            SizedBox(height: defaultPadding / 2,),
            Text(
              "방 구조",
              style: Theme
                .of(context)
                .textTheme
                .headline6,),
            SizedBox(height: defaultPadding / 2,),
            Properties(title: "침실", selected: 2,),
            SizedBox(height: defaultPadding / 2,),
            Properties(title: "화장실", selected: 1,),
            SizedBox(height: defaultPadding,),
            Text("옵션", style: Theme
                .of(context)
                .textTheme
                .headline6,),
            SizedBox(height: defaultPadding / 2,),
            Amenities(title: "가구",),
            Amenities(title: "애완 동물 허용",),
            Amenities(title: "공유 숙소",),
            SizedBox(height: defaultPadding / 2,),
            Container(
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Text(
                          "더보기",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: mainColor
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: mainColor
                      ),
                      child: Text(
                          "확인",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.white
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomSlider extends StatefulWidget {
  CustomSlider({
    Key? key,
  }) : super(key: key);

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  var selectedRange = RangeValues(20, 80);

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: mainColor.withOpacity(1),
        inactiveTrackColor: mainColor.withOpacity(.5),
        trackHeight: 4.0,
        rangeThumbShape: CustomThumbShape(
            max: 100,
            min: 1,
            thumbRadius: 10,
          thumbHeight: 30
        ),
        overlayColor: mainColor.withOpacity(.4),
        activeTickMarkColor: mainColor,
        inactiveTickMarkColor: Colors.red.withOpacity(.7),
      ),
      child: RangeSlider(
        values: selectedRange,
        max: 100,
        min: 1,
        divisions: 100,
        onChanged: (value) {
            setState(() {
              selectedRange = value;
            });
          },
      ),
    );
  }
}



