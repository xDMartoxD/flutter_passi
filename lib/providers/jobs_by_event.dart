import 'package:amplify_api/model_queries.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:passi_app/models/JobTypeEnum.dart';
import 'package:passi_app/models/ModelProvider.dart';
import 'package:passi_app/providers/event_provider.dart';
import 'package:passi_app/utils/amplify_utils.dart';

class JobsByEventProvider with ChangeNotifier {
  EventProvider? eventProvider;
  List<Job> _promoters = [];

  JobsByEventProvider({this.eventProvider});
  List<Job> get promoters => [..._promoters];

  Future<void> getPromotersByEvent() async {
    if (eventProvider == null) {
      return;
    }
    if (eventProvider == null || eventProvider?.event == null) {
      return;
    }
    try {
      final request = apiKeyRequest(
        ModelQueries.list(
          Job.classType,
          where: Job.EVENT.eq(eventProvider!.event!.id).and(Job.TYPE.eq(JobTypeEnum.Promoter)),
        ),
      );
      final response = await Amplify.API.query(request: request).response;
      final paginatedJobsResponse = response.data;
      if (paginatedJobsResponse == null) {
        safePrint('errors: ${response.errors}');
        return;
      }
      final List<Job> loadedJobs = [];
      for (var element in paginatedJobsResponse.items) {
        if (element != null) {
          loadedJobs.add(element);
        }
      }
      _promoters = loadedJobs;
      notifyListeners();
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
    }
  }
}
