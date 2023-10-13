import 'package:flutter/cupertino.dart';

import '../../utils/colors.dart';

Widget background(){
  return Column(
    children: [
      // Image.asset('assets/images/back_lines.jpg',
      //   color: kWhiteColor.withOpacity(0.5),colorBlendMode: BlendMode.modulate,),
      Spacer(),
      Image.asset('assets/images/background_two.png',
      color: kWhiteColor.withOpacity(0.5),colorBlendMode: BlendMode.modulate,),
    ],
  );
}