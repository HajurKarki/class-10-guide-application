import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  debugPrint('Loading .env from project root');
  await dotenv.load(fileName: '.env');
  debugPrint('Loaded .env successfully');
  await MobileAds.instance.initialize();
  runApp(const ClassTenApp());
}