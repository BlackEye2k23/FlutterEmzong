import 'package:emazong/res/app_colors.dart';
import 'package:emazong/utils/routes/route_inti.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'bindings/app_bindings.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(builder: (context) => GetMaterialApp(
      title: 'Emazong',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: AppColors().getBaseAppColor(),
      ),
      initialBinding: AppBindings(),
      getPages: RoutesInit.appRoutes(),
    ));
  }
}

