import 'package:flutter/material.dart';
import 'package:task_project/app/extensions.dart';

class MapMarker extends StatelessWidget {
  final VoidCallback? onTap;
  const MapMarker({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildMapMarker(onTap: onTap);
  }

  Positioned buildMapMarker({VoidCallback? onTap}) {
    return Positioned(
      top: 42.5.h,
      left: 46.w,
      child: InkWell(
        onTap: onTap,
        child: const Icon(Icons.arrow_drop_up_rounded),
      ),
    );
  }
}
