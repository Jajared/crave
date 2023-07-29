import 'package:crave/styles/colors.dart';
import 'package:crave/styles/styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = Provider(((ref) => AppColors().toThemeData()));
final stylesProvider = Provider(((ref) => AppStyle()));
