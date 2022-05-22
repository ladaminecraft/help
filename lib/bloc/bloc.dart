import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab_32/bloc/event.dart';
import 'package:lab_32/bloc/state.dart';

import '../repository/user_repository.dart';




class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final UserRepository userRepository;
  DashboardBloc({required this.userRepository}) : super(DashboardInitial()) {
    on<InitUserBox>(_initUserBox);
    on<FetchAllUserEvent>(_fetchAllUser);
    on<AddUserEvent>(_addNewUser);
    on<RemoveUserEvent>(_removeUser);
    on<UpdateUserEvent>(_updateUser);
    on<LoadDataEvent>(_loadData);
  }



   Future<void> _loadData(
    LoadDataEvent event,
    Emitter<DashboardState> emit
  ) async {
    try {
      emit(DashboardLoading ());
      final String qwer="https://api.weatherbit.io/v2.0/forecast/daily?lat=${event.url1}1&lon=${event.url2}1&key=5e2805de11cd4b7baad01f51ed9c7a23&include=minutely";
      final url = Uri.parse(qwer);
      await Future.delayed(const Duration(seconds: 1));
      final response = await http.get(url);
      if (response.statusCode != 200) {
        emit( DashboardError(error: response.statusCode.toString()));
      }
      final decodedResponse = jsonDecode(response.body);

      final updatedUserList = await userRepository.addUser(event.);
      emit(DashboardLoaded(userList: updatedUserList));

      emit(DashboardLoaded(userList: decodedResponse));
    } catch (e) {
      emit( DashboardError(error: e.toString()));
    }
  }



  FutureOr<void> _fetchAllUser(
      FetchAllUserEvent event, Emitter<DashboardState> emit) async {
    try {
      emit(DashboardLoading());
      final userList = userRepository.getUsers();
      emit(DashboardLoaded(userList: userList));
    } catch (e) {
      emit(DashboardError(error: e.toString()));
    }
  }

  FutureOr<void> _addNewUser(
      AddUserEvent event, Emitter<DashboardState> emit) async {
    try {
      emit(DashboardLoading());
      final updatedUserList = await userRepository.addUser(event.user);
      emit(DashboardLoaded(userList: updatedUserList));
    } catch (e) {
      emit(DashboardError(error: e.toString()));
    }
  }

  FutureOr<void> _initUserBox(
      InitUserBox event, Emitter<DashboardState> emit) async {
    await userRepository.init();
    add(FetchAllUserEvent());
  }

  FutureOr<void> _removeUser(
      RemoveUserEvent event, Emitter<DashboardState> emit) async {
    try {
      emit(DashboardLoading());
      final updatedUserList = await userRepository.removeUser(event.id);
      emit(DashboardLoaded(userList: updatedUserList));
    } catch (e) {
      emit(DashboardError(error: e.toString()));
    }
  }

  FutureOr<void> _updateUser(
      UpdateUserEvent event, Emitter<DashboardState> emit) async {
    try {
      emit(DashboardLoading());
      final updatedUserList = await userRepository.updateUserInfo(event.user);
      emit(DashboardLoaded(userList: updatedUserList));
    } catch (e) {
      emit(DashboardError(error: e.toString()));
    }
  }
}