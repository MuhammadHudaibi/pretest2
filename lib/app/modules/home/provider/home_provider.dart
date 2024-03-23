import 'package:get/get.dart';
import 'package:pretest2/app/data/home_model.dart';

class HomeProvider extends GetConnect {
  Future<HomeModel> fetchHomeData() async {
    final response = await get('https://randomuser.me/api/');

    if (response.status.isOk) {
      return HomeModel.fromJson(response.body);
    } else {
      throw Exception('Failed to load home data: ${response.statusText}');
    }
  }
}
