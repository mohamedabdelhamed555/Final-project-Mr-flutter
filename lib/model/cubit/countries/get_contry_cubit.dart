import 'package:bloc/bloc.dart';
import 'package:final_project/model/data/country_data.dart';
import 'package:final_project/model/repository/get_repo_country.dart';
import 'package:flutter/material.dart';

part 'get_contry_state.dart';

class GetContryCubit extends Cubit<CountriesState> {
  GetContryCubit() : super(CountriesInitial());

  void getAllCountries() {
    emit(CountriesLoading());
    GetNewsRepo().getCountry().then((value) {
      if (value != null) {
        emit(CountriesSuccess(response: value));
      } else {
        emit(CountriesFailure());
        debugPrint("request failed");
      }
    });
  }
}
