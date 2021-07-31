import 'package:flutter/material.dart';

import '../../../constants.dart';

class ChangeButton extends StatelessWidget {
  const ChangeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: Row(
        children: [
          Expanded(child: SizedBox()),
          InkWell(
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
                  color: mainColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0.1,
                      blurRadius: 1,
                      offset: Offset(-2, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: Icon(Icons.list_rounded, color: Colors.white,),
              )
          ),
          InkWell(
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0.1,
                      blurRadius: 1,
                      offset: Offset(2, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: Icon(Icons.location_on_rounded, color: mainColor,),
              )
          ),
        ],
      ),
    );
  }
}