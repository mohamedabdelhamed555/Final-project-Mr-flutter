import 'package:bloc/bloc.dart';
import 'package:final_project/model/data/countrydata.dart';
import 'package:final_project/model/repository/get_repo_country.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter/cupertino.dart';

part 'get_contry_state.dart';

class GetContryCubit extends Cubit<GetContryState> {
  GetContryCubit() : super(GetContryInitial());
}

// void getAllCountries() {
//   emit(CountriesLoading());
//   GetNewsRepo().getCountry().then((value) {
//     if (value != null) {
//       emit(CountriesSuccess(response: value));
//     } else {
//       emit(CountriesFailure());
//       debugPrint("request failed");
//     }
//   });
// }

// late List<Result>? filteredItems;

// void searchItems(List<Result>? list, String value) {
//   filteredItems = list!
//       .where((element) =>
//           element.countryName!.toLowerCase().contains(value.toLowerCase()))
//       .toList();
//   emit(CountriesResult());
// }
