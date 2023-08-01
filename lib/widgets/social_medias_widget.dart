import 'package:flutter/material.dart';

import '../export_all.dart';

class SocialMediasWidget extends StatelessWidget {
  const SocialMediasWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SpringWidget(
          onTap: () {},
          child: Container(
            height: 50,
            width: 50,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(colors: [
                Color(0xff5C82E8),
                Color(0xff3A559F),
              ]),
            ),
            child: SvgPicture.asset(fbIcon,
                // color: white,
                colorFilter: ColorFilter.mode(white, BlendMode.srcIn)),
          ),
        ),
        20.horizontalSpace,
        SpringWidget(
          onTap: () {},
          child: Container(
            height: 50,
            width: 50,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(colors: [
                Color(0xffFF5C4D),
                Color(0xffCB3E32),
              ]),
            ),
            child: SvgPicture.asset(googleIcon,
                // color: white,
                colorFilter: ColorFilter.mode(white, BlendMode.srcIn)),
          ),
        ),
        20.horizontalSpace,
        SpringWidget(
          onTap: () {},
          child: Container(
            height: 50,
            width: 50,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: white),
            child: SvgPicture.asset(appleIcon,
                // color: white,
                colorFilter: ColorFilter.mode(black, BlendMode.srcIn)),
          ),
        ),
      ],
    );
  }
}
