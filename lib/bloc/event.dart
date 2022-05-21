import 'package:equatable/equatable.dart';

import '../model/user_model.dart';




abstract class DashboardEvent extends Equatable {
  const DashboardEvent();
  @override
  List<Object> get props => [];
}


class LoadDataEvent extends DashboardEvent {
  final String url1;
  final String url2;
 const LoadDataEvent({required this.url1,required this.url2,});}


class InitUserBox extends DashboardEvent {}

class FetchAllUserEvent extends DashboardEvent {}

class AddUserEvent extends DashboardEvent {
  final User user;
  const AddUserEvent({
    required this.user,
  });
}

class RemoveUserEvent extends DashboardEvent {
  final String id;
  const RemoveUserEvent({
    required this.id,
  });
}

class UpdateUserEvent extends DashboardEvent {
  final User user;
  const UpdateUserEvent({
    required this.user,
  });
}
