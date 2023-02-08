// Package imports:
import 'package:fluttertoast/fluttertoast.dart';

// Project imports:
import '../../utils/colors.dart';

class CommonComponents{
  static showToast(){
    return Fluttertoast.showToast(
        msg: "Search Icon Tapped",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: white,
        fontSize: 16.0
    );
  }

}
