import 'package:api_cubit/controller/cubit/album_cubit.dart';
import 'package:api_cubit/utils/repo/album_repo.dart';
import 'package:api_cubit/view/screens/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (create)=> AlbumCubit(AlbumRepo()),
    child: const ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        home: HomePage(),
      ),
    ),
    );
  }
}

