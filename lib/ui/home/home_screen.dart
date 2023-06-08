import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:task_project/app/di/module/dio_module.dart';
import 'package:task_project/ui/home/google_map_cubit/google_map_cubit.dart';
import 'package:task_project/ui/home/google_map.dart';

import '../../app/app_colors.dart';
import '../../app/app_router.dart';
import '../../app/app_sized_box.dart';
import '../../app/di/di.dart';
import '../../app/my_positon.dart';
import '../../data/model/markers_response.dart';
import '../../data/storage/local/app_prefs.dart';
import '../../app/extensions.dart';
import '../componnents/componnents.dart';
//import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'get_markers_cubit/get_markers_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Markers markers;
  CurantPosition curantPosition = CurantPosition();
  late Stream<Position?> positionStream;
  late StreamSubscription<Position?> streamSubscription;
  Stream<Position?> getPosition() async* {
    while (true) {
      Position? position = await curantPosition.getMyPosition();
      yield position;
      await Future.delayed(const Duration(seconds: 10));
    }
  }

  Future<void> sendToFireBase(Position position) async {
    await FirebaseFirestore.instance
        .collection('position')
        .doc('position')
        .set({
      'latitude': position.latitude,
      'longitude': position.longitude,
    });
  }

  void startStream(BuildContext context) {
    try {
      curantPosition.getMyPosition().then((value) {
        streamSubscription = positionStream.listen(
          (event) async {
            if (event != null) {
              buildToast(context,
                  "lat is ${event.latitude} lon is ${event.longitude}");
              print("object");
              await sendToFireBase(event);
            }
          },
          cancelOnError: true,
        );
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    positionStream = getPosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<GetMarkersCubit>()..getMarkers(),
        ),
        BlocProvider(
          create: (context) => GoogleMapCubit(),
        ),
      ],
      child: Scaffold(body: loginRequestBuilder()),
    );
  }

  Widget loginRequestBuilder() {
    return BlocConsumer<GetMarkersCubit, GetMarkersState>(
      listener: (context, state) async {
        if (state is ScGetMarkers) {
          startStream(context);
          await GoogleMapCubit.get(context)
              .mapInit(GetMarkersCubit.get(context).response!.data.orEmpty());
        }
        if (state is ErorrGetMarkers && state.failur.erorrMessege.isNotEmpty) {
          buildToast(context, state.failur.erorrMessege);
        }
      },
      builder: (context, state) {
        if (state is LoadinGetMarkers) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return screenBody();
        }
      },
    );
  }

  Widget screenBody() {
    return Padding(
      padding: EdgeInsets.all(5.w),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const RegistrationMapScreen(),
            AppSizedBox.h3,
            const Divider(
              color: AppColors.blackColor,
              height: 2,
            ),
            logOutWidget()
          ],
        ),
      ),
    );
  }

  Widget logOutWidget() {
    return Builder(builder: (context) {
      return TextButton(
          onPressed: () {
            logOut(context);
          },
          child: const Text("Log Out"));
    });
  }

  void logOut(BuildContext context) async {
    AppPreferences appPreferences = getIt<AppPreferences>();
    appPreferences.userToken = "";
    appPreferences.userData = null;
    getIt<AppPreferences>().remove('userType');
    getIt<Dio>().updateHeader(appPreferences);
    streamSubscription.cancel();
    Navigator.of(context).pushNamedAndRemoveUntil(
        AppRouter.loginScreen, (Route<dynamic> route) => false);
  }
}
