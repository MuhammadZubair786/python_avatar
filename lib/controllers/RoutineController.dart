import 'package:chatbot_app/export_all.dart';

class RotineController extends GetxController {
  //
  List rotinedata = [];
  List mainRoutine = [
    {
      "startDate": "",
      "endDate": "",
      "startTime": "",
      "endTime": "",
      "totalCal": 0
    }
  ];

  addRotineData(dynamic data) {
    rotinedata.add(data);
    update();
  }

  updateTotalKcl(totalkcl){
    mainRoutine[0]["totalCal"]=totalkcl.toString();
    update();
  }

  StoreRoutineDetails(
      String startdate, String enddate, String starttime, String endtime) {
    mainRoutine[0]["startDate"] = startdate.toString();
    mainRoutine[0]["endDate"] = enddate.toString();
    mainRoutine[0]["startTime"] = starttime.toString();
    mainRoutine[0]["endTime"] = endtime.toString();
    update();
  }

}
