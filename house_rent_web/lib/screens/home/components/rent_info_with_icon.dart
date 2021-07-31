import 'package:flutter/material.dart';

import '../../../constants.dart';

class RentInfoWithIcon extends StatelessWidget {
  const RentInfoWithIcon({
    Key? key,
    required this.title,
    required this.subTitle,
    this.icon
  }) : super(key: key);

  final String title;
  final String subTitle;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            title,
            style: Theme.of(context).textTheme.headline5
        ),
        SizedBox(height: defaultPadding / 2,),
        Row(
          children: [
            Text(
              subTitle,
              style: Theme.of(context).textTheme.headline4!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),
            ),
            SizedBox(width: defaultPadding / 2,),
            if(icon != null)
              Icon(icon, size: 25,)
          ],
        )
      ],
    );
  }
}