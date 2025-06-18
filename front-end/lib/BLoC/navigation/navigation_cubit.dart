import 'package:flutter_bloc/flutter_bloc.dart';

enum NavigationItem { home, match, chat, profile }

class NavigationCubit extends Cubit<NavigationItem> {
  NavigationItem previousItem = NavigationItem.home;

  NavigationCubit() : super(NavigationItem.home);

  void updateIndex(NavigationItem item) {
    if (item != NavigationItem.match) {
      previousItem = item;
    }
    emit(item);
  }
}