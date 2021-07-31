import 'package:flutter/material.dart';

import '../../../constants.dart';

class RentImage extends StatelessWidget {
  RentImage({
    Key? key,
  }) : super(key: key);

  final List<String> _image = [
    "assets/images/main_image_1.jpg",
    "assets/images/main_image_2.jpg",
    "assets/images/main_image_3.jpg",
    "assets/images/main_image_4.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(defaultPadding),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: new DecorationImage(
                      image: new AssetImage("assets/images/thumbnail_1.jpg"),
                      fit: BoxFit.fill,
                  )
                ),
              ),
            )
        ),
        Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding / 2),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  var _width = constraints.maxWidth / 3;
                  var _height = constraints.maxHeight;
                  return ListView.builder(
                    physics: PageScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: _image.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: _width,
                        height: _height,
                        padding: EdgeInsets.symmetric(
                            horizontal: defaultPadding / 2),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10)),
                              image: new DecorationImage(
                                image: new AssetImage(_image[index]),
                                fit: BoxFit.fill,
                              )
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            )
        )
      ],
    );
  }
}