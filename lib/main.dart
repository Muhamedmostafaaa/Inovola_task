import 'package:flutter/material.dart';
import 'package:inovola_task/app/app.dart';
import 'package:inovola_task/core/services/service_locator.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().init();
runApp(const MyApp());
}


