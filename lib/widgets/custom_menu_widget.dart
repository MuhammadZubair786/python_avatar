import 'package:flutter/material.dart';

class CustomMenuWidget {
  // const CustomMenuWidget({super.key});

  static Future showBottomSheet(
    BuildContext context,
    List<CustomMenuTile> customTilesList,
  ) {
    // return Get.bottomSheet(ConversationOptionsModal(
    //   userId: userId,
    //   customTilesList: customTilesList,
    // ));
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        // isScrollControlled: true,
        // useRootNavigator: true,
        // constraints: BoxConstraints(
        //     maxWidth: MediaQuery.of(context).size.width * 0.9,
        //     minWidth: MediaQuery.of(context).size.width * 0.9),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14),
            topRight: Radius.circular(14),
          ),
        ),
        context: context,
        builder: (context) => Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            margin: const EdgeInsets.all(15),
            // margin: EdgeInsets.only(bottom: 90),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(14)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: customTilesList,
            )));
  }
}

class CustomMenuTile extends StatefulWidget {
  final VoidCallback onTapped;
  final String iconSource;
  final bool isIcon;
  final String subtitle;
  final String text;
  final Color color;

  const CustomMenuTile({
    super.key,
    required this.onTapped,
    this.iconSource = '',
    this.isIcon = false,
    required this.text,
    this.subtitle = '',
    this.color = Colors.black,
  });

  @override
  State<CustomMenuTile> createState() => _CustomMenuTileState();
}

class _CustomMenuTileState extends State<CustomMenuTile> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onPanDown: (details) {
        setState(() {
          pressed = true;
        });
      },
      onPanEnd: (_) {
        setState(() {
          pressed = false;
        });
      },
      onPanCancel: () {
        setState(() {
          pressed = false;
        });
      },
      onTap: widget.onTapped,
      child: Container(
        height: widget.subtitle.isEmpty ? 50 : null,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        color: pressed ? Colors.grey.withOpacity(0.1) : null,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            // if (widget.isIcon)
            //   SvgPicture.asset(
            //     widget.iconSource,
            //     color: widget.color,
            //     width: 20,
            //     height: 20,
            //   ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.text,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  if (widget.subtitle.isNotEmpty)
                    Text(
                      widget.subtitle,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
