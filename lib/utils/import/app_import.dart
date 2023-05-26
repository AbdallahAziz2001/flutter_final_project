import 'dart:developer' as developer;
import 'dart:convert';
import 'dart:async';
import 'dart:io';

import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:quantity_input/quantity_input.dart';
import 'package:flutter/material.dart';

// ************************* Utils ************************* //

part '../../main.dart';
part '../../view/widgets/custom_textfield.dart';
part '../../view/food_groups/food_groups.dart';
part '../../view/food_groups/add_edit_food_group.dart';
part '../../view/food/food.dart';
part '../../view/food/add_edit_food.dart';
part '../../view/app_home/bodies/home.dart';
part '../../view/app_home/bodies/groups.dart';
part '../../view/app_home/bodies/favorite.dart';
part '../../view/app/splash_screen.dart';
part '../../view/app/app_home.dart';
part '../../view/app/app_drawer.dart';
part '../../view/app/app_bottom_navigation_bar.dart';
part '../../view/app/app_appbar.dart';
part '../css/mycss.dart';
part '../../Model/food.dart';
part '../../Model/food_group.dart';
part '../../Model/app_provider.dart';
part '../../controllers/db_helper.dart';
