import 'package:flutter_bloc/flutter_bloc.dart';

enum NavigationItem { home, match, chat, profile }

class NavigationCubit extends Cubit<NavigationItem> {
  NavigationCubit() : super(NavigationItem.home);

  void updateIndex(NavigationItem item) => emit(item);
}
