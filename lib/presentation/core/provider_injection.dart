import 'package:academic_master/presentation/auth/provider/auth_tab_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<AuthTabProvider>(
    create: (context) => AuthTabProvider(),
  ),
];
