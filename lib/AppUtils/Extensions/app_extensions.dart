import 'package:spleenify_task/AppUtils/app_imports.dart';

extension ScreenSize on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
  double heightPercentage(double percentage) => screenHeight * (percentage / 100);
  double widthPercentage(double percentage) => screenWidth * (percentage / 100);
}