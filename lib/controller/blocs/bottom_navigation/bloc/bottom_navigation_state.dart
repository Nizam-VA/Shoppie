part of 'bottom_navigation_bloc.dart';

class BottomNavigationState {
  final int value;
  BottomNavigationState({required this.value});
}

class BottomNavigationInitial extends BottomNavigationState {
  BottomNavigationInitial() : super(value: 0);
}
