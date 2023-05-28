import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final imageURL =
        "https://media.licdn.com/dms/image/D5603AQG2qGmNYbigMA/profile-displayphoto-shrink_200_200/0/1665037410713?e=1681948800&v=beta&t=e3p89D002d0-fZ9KLv_icPxF3k5Lrn6SvCKp1BpQtXE";
    return Drawer(
        backgroundColor: context.canvasColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: context.canvasColor),
                  accountName: Text(
                    "Harsh",
                    style: TextStyle(color: context.accentColor),
                  ),
                  accountEmail: Text("nainwaya@gmai.com",
                      style: TextStyle(color: context.accentColor)),
                  currentAccountPicture:
                      CircleAvatar(backgroundImage: NetworkImage(imageURL)),
                )),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: context.accentColor,
              ),
              title: Text("Home", style: TextStyle(color: context.accentColor)),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: context.accentColor,
              ),
              title: Text("profile checked",
                  style: TextStyle(color: context.accentColor)),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: context.accentColor,
              ),
              title: Text("Email me",
                  style: TextStyle(color: context.accentColor)),
            )
          ],
        ));
  }
}
