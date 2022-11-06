import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kyan/const/consts.dart';
import 'package:kyan/screen/app/app.dart';

void main() async {
  await dotenv.load(fileName: ENV_FILE);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}
