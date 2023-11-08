part of 'bottom_navigation_bloc.dart';

class BottomNavigationEvent {}

class BottomNavigationValueChangeEvent extends BottomNavigationEvent {
  final int value;
  BottomNavigationValueChangeEvent({required this.value});
}
