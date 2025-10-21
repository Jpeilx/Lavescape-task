
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavescape/features/chat/views/inbox_screen.dart';
import 'package:lavescape/features/explore/views/explore_screen.dart';
import 'package:lavescape/features/layout/logic/cubit/app_layout_states.dart';
import 'package:lavescape/features/profile/views/profile_screen.dart';
import 'package:lavescape/features/reservation/views/reservation_screen.dart';
import 'package:lavescape/features/wishlist/views/wishlist_screen.dart';

class AppLayoutCubit extends Cubit<AppLayoutStates> {
  AppLayoutCubit() : super(AppLayoutInitialState());
  static AppLayoutCubit get(context) => BlocProvider.of(context);
  int currentButtomNavIndex = 0;
  List<Widget> supermarketScreens = [
    const ExploreScreen(),
    const ReservationScreen(),
    const WishlistScreen(),
    const InboxScreen() ,
    const  ProfileScreen()
  ];
  void changeButtonNavItem(int index) {
    currentButtomNavIndex = index;
    emit(ChangeButtomNavItemState());
  }
}
