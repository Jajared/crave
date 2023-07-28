import 'package:bereal/core/models/user_model.dart';
import 'package:bereal/db/config.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDB {
  static var db, userCollection, feedCollection;
  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    userCollection = db.collection(USER_COLLECTION);
    feedCollection = db.collection(FEED_COLLECTION);
  }

  static Future<bool> addNewUser(UserModel newUser) async {
    try {
      await userCollection.insertOne(newUser.toJson());

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
