import 'package:get/get.dart';
import 'package:pretest2/app/data/home_model.dart';
import 'package:pretest2/app/modules/home/provider/home_provider.dart';

class HomeController extends GetxController {
  final HomeProvider _homeProvider = HomeProvider();
  var homeModel = HomeModel(results: [], info: Info(seed: '', results: 0, page: 0, version: '')).obs;

  @override
  void onInit() {
    fetchHomeModel();
    super.onInit();
  }

  Future<void> fetchHomeModel() async {
    try {
      homeModel.value = await _homeProvider.fetchHomeData();
    } catch (error) {
      print("Error fetching home model: $error");
    }
  }
}
