import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:task_project/app/extensions.dart';
import 'google_map_cubit/google_map_cubit.dart';

class RegistrationMapScreen extends StatefulWidget {
  const RegistrationMapScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<RegistrationMapScreen> createState() => _RegistrationMapScreenState();
}

class _RegistrationMapScreenState extends State<RegistrationMapScreen> {
  // @override
  // void dispose() {
  //   GoogleMapCubit.get(context).mapController?.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GoogleMapCubit, GoogleMapState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SizedBox(
            width: double.infinity,
            height: 60.h,
            child: buildGoogleMap(),
          );
        });
  }

  buildGoogleMap() {
    return Builder(builder: (context) {
      GoogleMapCubit cubit = GoogleMapCubit.get(context);
      return GoogleMap(
        mapType: MapType.normal,
        //zoomControlsEnabled: false,
        //onCameraMove: cubit.onMapMove,
        //onCameraIdle: cubit.onMapStop,
        myLocationEnabled: true,
        tiltGesturesEnabled: true,
        compassEnabled: true,
        scrollGesturesEnabled: true,
        zoomGesturesEnabled: true,
        polylines: Set<Polyline>.of(cubit.polylines.values),
        initialCameraPosition: cubit.initialCameraPosition,
        markers: Set.from(cubit.markers),
        onMapCreated: cubit.onMapCreated,
      );
    });
  }

  // Widget buildMapButton() {
  //   return Builder(builder: (context) {
  //     GoogleMapCubit cubit = GoogleMapCubit.get(context);
  //     return Positioned(
  //       bottom: 4.h,
  //       left: 5.w,
  //       right: 5.w,
  //       child: TextButton(
  //         onPressed: () {
  //           if (cubit.position != null) {
  //             // Navigator.of(context, rootNavigator: true).pop(cubit.position);
  //           } else {
  //             // WidgetsBinding.instance.addPostFrameCallback((_) => popDialog(
  //             //     context: context,
  //             //     title: 'error',
  //             //     content: 'errorLocation',
  //             //     boxColor: AppColors.errorColor));
  //           }
  //         },
  //         child: const Text(
  //           'confirm',
  //           style: TextStyle(
  //             color: AppColors.whiteColor,
  //           ),
  //         ),
  //       ),
  //     );
  //   });
  // }

  // Widget buildAddressBox() {
  //   return Builder(builder: (context) {
  //     GoogleMapCubit cubit = GoogleMapCubit.get(context);
  //     return Positioned(
  //         bottom: 12.h,
  //         left: 5.w,
  //         right: 5.w,
  //         child: cubit.moving
  //             ? const Center(child: CircularProgressIndicator())
  //             : Container(
  //                 height: 6.2.h,
  //                 width: 80.w,
  //                 padding: EdgeInsets.all(1.h),
  //                 decoration: BoxDecoration(
  //                   color: AppColors.whiteColor,
  //                   borderRadius: BorderRadius.circular(12.sp),
  //                 ),
  //                 child: Center(
  //                   child: Text(
  //                     cubit.userAddress,
  //                     overflow: TextOverflow.ellipsis,
  //                     textAlign: TextAlign.center,
  //                     style: AppTextStyle.getRegularStyle(
  //                       color: Colors.grey,
  //                       fontSize: 11.sp,
  //                     ),
  //                   ),
  //                 ),
  //               ));
  //   });
  // }

}
