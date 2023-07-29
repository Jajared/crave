import 'package:crave/core/models/post_model.dart';
import 'package:crave/core/models/user_model.dart';
import 'package:crave/db/config.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDB {
  static var db, userCollection, feedCollection;
  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    userCollection = db.collection(USER_COLLECTION);
    feedCollection = db.collection(FEED_COLLECTION);
  }

  static Future<List<PostModel>> getFeedData() async {
    final result = await feedCollection.find().toList();
    final parsedResult =
        await result.map<PostModel>((e) => PostModel.fromJson(e)).toList();
    return parsedResult;
  }

  static Future<bool> addPost(PostModel newPost) async {
    try {
      feedCollection.insertOne(newPost.toJson());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
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
