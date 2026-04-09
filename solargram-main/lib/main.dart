import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/theme/app_theme.dart';
import 'screens/main_dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Supabase.initialize(
    url: 'https://lzfgowjehtethrjslvbx.supabase.co',
    anonKey: 'ENTER_YOUR_ANON_KEY_HERE', // TODO: Add your actual anon key
  );

  runApp(const SolarGramApp());
}

class SolarGramApp extends StatelessWidget {
  const SolarGramApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        title: 'SolarGram',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const MainDashboard(),
      ),
    );
  }
}
