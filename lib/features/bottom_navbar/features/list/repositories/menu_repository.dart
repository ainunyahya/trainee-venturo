// import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:trainee/constants/cores/api/api_constant.dart';
import 'package:trainee/features/bottom_navbar/features/list/models/menu_model.dart';
import 'package:trainee/shared/global_repositories/api_exception_repository.dart';
import 'package:trainee/utils/services/dio_service.dart';
import 'package:trainee/utils/services/local_storage_service.dart';

class MenuRepository {
  MenuRepository._();

  // init dio from DioService
  static final Dio _dio = DioService.dioCall();
  // get user data from LocalStorageService
  static final _userData = LocalStorageService.getUserData();

  static Future<MenusModel> getAllMenu() async {
    // print(_userData);
    // print("asdjdj");
    try {
      // print("menu repo get all menu");
      final response = await _dio.get(
        ApiConstant.getAllMenu,
        options: Options(
          headers: {
            "token" : "5b90e85d28255df4e6c4e57053d0a87063157de3"
            // "token": _userData["data"]["token"],
          },
        ),
      );
      if (response.statusCode == 200) {
        // print("xaxafdvdf");
        // print("response api: ${response.data}");
        return MenusModel.fromJson(response.data);
      } else {
        // print("kokssas");
        final errorData = response.data;
        final errorMessage =
            errorData['errors'] != null && errorData['errors'].isNotEmpty
                ? errorData['errors'][0]
                : 'Unknown error';
        throw ApiException(errorMessage, statusCode: response.statusCode);
      }
    } catch (e) {
      // print("anasasasaasas");
      // print("response api: ${e}");
      if (e is DioException) {
        final errorData = e.response?.data;
        final errorMessage =
            errorData['errors'] != null && errorData['errors'].isNotEmpty
                ? errorData['errors'][0]
                : 'Network error: ${e.message}';
        throw ApiException(errorMessage, statusCode: e.response?.statusCode);
      } else {
        throw ApiException(e.toString());
      }
    }
  }
}