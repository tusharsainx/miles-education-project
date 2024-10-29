import 'package:miles_ed_project/helper/api_status_class_helper.dart';
import 'package:miles_ed_project/homepage/data_models/homepage_data_model.dart';
import 'package:miles_ed_project/homepage/data_models/testimonials_data_model.dart';
import 'package:miles_ed_project/network_requester/api.dart';
import 'package:miles_ed_project/network_requester/me_network_requester.dart';

class MEHomepageRepository {
  final _networkRequester = MENetworkRequester();
  Future<Status<MEHomepageDataModel>> getHomepageData() async {
    try {
      final homepageData =
          await _networkRequester.request(Api.baseUrl, Api.homepageMockData);
      return Status.success(data: MEHomepageDataModel.fromJson(homepageData));
    } catch (e) {
      return Status.error();
    }
  }

  Future<Status<METestimonialsDataModel>> getTestimonialsData() async {
    try {
      final testimonialsData = await _networkRequester.request(
          Api.baseUrl, Api.testimonialsMockData);
      return Status.success(
          data: METestimonialsDataModel.fromJson(testimonialsData));
    } catch (e) {
      return Status.error();
    }
  }
}
