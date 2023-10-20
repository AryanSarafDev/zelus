import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:zelus/Screens/Profile.dart';
import 'package:zelus/Screens/login_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase/supabase.dart';
final String _supaBaseUrl = 'https://hgttddbjktjabhdbhvic.supabase.co';
final String _supaBaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhndHRkZGJqa3RqYWJoZGJodmljIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTc3ODgxMTMsImV4cCI6MjAxMzM2NDExM30.TGIgJ1PxaOp6HPw-Stp7U3dyV4OOzW2_cOqEz_e7aJQ';

void main() {
  Get.put<SupabaseClient>(SupabaseClient(_supaBaseUrl, _supaBaseKey));
  Get.put<GetStorage>(GetStorage());
  runApp(
      const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(useMaterial3: true),
     home: LoginPage(),
    );
  }
}
