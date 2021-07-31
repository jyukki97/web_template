import 'package:flutter/material.dart';

import '../../../constants.dart';

class CloserLocation extends StatelessWidget {
  const CloserLocation({
    Key? key,
    required this.iconData,
    required this.description,
    required this.distance
  }) : super(key: key);

  final IconData iconData;
  final String description;
  final double distance;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 15,
          backgroundColor: Colors.grey.withOpacity(0.1),
          child: Icon(iconData, size: 18, color: mainColor,),
        ),
        SizedBox(width: defaultPadding,),
        Expanded(
            child: Text(
                description,
                style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontSize: 15
                )
            )
        ),
        Text(
          "$distance km",
          style: Theme.of(context).textTheme.headline5!.copyWith(
              fontSize: 10,
              color: Colors.black.withOpacity(0.7),
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(width: defaultPadding,)
      ],
    );
  }
}
