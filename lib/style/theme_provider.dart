import 'package:flutter/material.dart';
import 'package:flutter_base/db/sp/sp_key.dart';
import 'package:flutter_base/db/sp/sp_utils.dart';
import 'package:provider/provider.dart';

import 'theme_base.dart';
import 'theme_black.dart';
import 'theme_normal.dart';

///
/// Create by Hugo.Guo
/// Date: 2019-07-23
///
class ThemeProvider with ChangeNotifier {
  ThemeBase _themeBase;
  AppTheme _appTheme;

  ///根据不同 AppTheme 加载不同的主题颜色
  static Map<AppTheme, ThemeBase> _colorValues = {
    AppTheme.night: new ThemeBlack(),
    AppTheme.light: new ThemeNormal(),
  };

  ThemeProvider(this._appTheme) {
    _themeBase = _colorValues[_appTheme];
  }

  void changeTheme(AppTheme theme) {
    _appTheme = theme;
    _themeBase = _colorValues[_appTheme];
    notifyListeners();
  }

  get themeBase => _themeBase;

  get appTheme => _appTheme;

  static void switchTheme(BuildContext context) {
    if (getAppTheme(context) == AppTheme.light) {
      SpUtils().put(SpKey.isNight, true);
      Provider.of<ThemeProvider>(context).changeTheme(AppTheme.night);
    } else {
      SpUtils().put(SpKey.isNight, false);
      Provider.of<ThemeProvider>(context).changeTheme(AppTheme.light);
    }
  }

  static AppTheme getAppTheme(BuildContext context) {
    return Provider.of<ThemeProvider>(context).appTheme;
  }
}

enum AppTheme { light, night }
