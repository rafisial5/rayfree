import 'package:flutter/material.dart';

import '../../utils/colors.dart';

Widget drawerView (){
  return Drawer(
    child: ListView(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: kBlueLightColor,
            borderRadius: const BorderRadius.only(bottomRight: Radius.circular(100)),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: kWhiteColor
                ),
                child: Icon(Icons.person, color: kLightGreyColor, size: 70,),
              ),
              const SizedBox(height: 10,),
              Text(
                "FULL NAME",
                style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
        ListTile(
          title: const Text(
              "H O M E",),
          leading: Icon(Icons.home, color: kBlueLightColor,),
          onTap: (){},
        ),
        ListTile(
          title: const Text(
            "P R O F I L E",),
          leading: Icon(Icons.person, color: kBlueLightColor,),
          onTap: (){},
        ),
        ListTile(
          title: const Text(
            "S H A R E  M O N E Y",),
          leading: Icon(Icons.attach_money, color: kBlueLightColor,),
          onTap: (){},
        ),
        const Divider(),
        const ListTile(
          title: Text(
            "Feedback to Company",),
        ),
        ListTile(
          title: const Text(
            "C O M P L A I N T  U S",),
          leading: Icon(Icons.announcement, color: kBlueLightColor,),
          onTap: (){},
        ),
        ListTile(
          title: const Text(
            "R A T E  U S",),
          leading: Icon(Icons.star, color: kBlueLightColor,),
          onTap: (){},
        ),
        ListTile(
          title: const Text(
            "A B O U T  U S",),
          leading: Icon(Icons.info_outline, color: kBlueLightColor,),
          onTap: (){},
        ),
        const Divider(),
        ListTile(
          title: const Text(
            "L O G O U T",),
          leading: Icon(Icons.logout, color: kBlueLightColor,),
          onTap: (){},
        ),
      ],
    ),
  );
}