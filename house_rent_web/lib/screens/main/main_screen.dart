import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:house_rent_web/controllers/MenuController.dart';
import 'package:house_rent_web/responsive.dart';
import 'package:house_rent_web/screens/home/home_screen.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import 'components/side_menu.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> _appbarText = ["Buy", "Sell", "Rent"];

  int isSelect = 0;

  @override
  Widget build(BuildContext context) {
    var height = AppBar().preferredSize.height;

    return Scaffold(
      backgroundColor: mainColor.withOpacity(0.05),
      key: context
          .read<MenuController>()
          .scaffoldKey,
      drawer: SideMenu(),
      appBar:  PreferredSize(
          preferredSize: Size.fromHeight(height),
          child: Container(
            color: Colors.white,
            height: height,
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      if(!Responsive.isDesktop(context))
                        Row(
                          children: [
                            InkWell(
                              onTap: context.read<MenuController>().controlMenu,
                              child: Icon(Icons.menu),
                            ),
                            SizedBox(width: defaultPadding / 2,)
                          ],
                        ),
                      for (var i = 0; i < _appbarText.length; i++)
                        Row(
                          children: [
                            InkWell(
                              onTap: (){
                                setState(() {
                                  isSelect = i;
                                });
                              },
                              child: Text(
                                  _appbarText[i],
                                  style: Theme.of(context).textTheme.headline6!.copyWith(
                                      color: isSelect==i ? Colors.black : Colors.black.withOpacity(0.5)
                                  )
                              ),
                            ),
                            SizedBox(width: defaultPadding,)
                          ],
                        ),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  Expanded(
                    child: SearchBar(),
                  ),
                Expanded(
                    child: MyIcon()
                )
              ],
            ),
          )
      ),
      body: Row(
        children: [
          if(Responsive.isDesktop(context))
            SideMenu(),
          Expanded(
              child: HomeScreen()
          )
        ],
      ),
    );
  }
}

class MyIcon extends StatelessWidget {
  const MyIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: mainColor.withOpacity(0.1),
          child: Icon(Icons.notifications_none_rounded, color: mainColor,),
        ),
        SizedBox(width: defaultPadding / 2,),
        CircleAvatar(
          radius: 20,
          backgroundColor: mainColor.withOpacity(0.1),
          child: Icon(Icons.person, color: mainColor,),
        ),
      ],
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: defaultPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: mainColor.withOpacity(0.1),
        ),
        child: Row(
          children: [
            Icon(Icons.search_rounded, color: mainColor,),
            SizedBox(width: defaultPadding / 2,),
            Expanded(
                child: TextField(
                  textAlign: TextAlign.end,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                )
            ),
            VerticalDivider(),
            Icon(Icons.arrow_drop_down),
            SizedBox(width: defaultPadding / 2,),
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                  image: new DecorationImage(
                    image: new AssetImage("assets/images/korea.png"),
                    fit: BoxFit.cover,
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}