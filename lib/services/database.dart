import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseService {
  final String uid;
  DataBaseService({this.uid});
  final CollectionReference userCollection =
      Firestore.instance.collection("Users");

  Future updateUserData(
      String name,
      String phoneNo,
      String email,
      String year,
      String branch,
      String rollNo,
      String linkedInURL,
      String githubURL,
      List domains,
      List languages,
      bool hosteller,
      String post,
      String cohort,
      String token,
      String dpurl,
      List<dynamic> peerID) async {
    return await userCollection.document(uid).setData({
      'name': name,
      'year': year,
      'email': email,
      'rollNo': rollNo,
      'branch': branch,
      'contact': phoneNo,
      'linkedInURL': linkedInURL,
      'githubURL': githubURL,
      'domains': domains,
      'hosteller': hosteller,
      'languages': languages,
      'post': post,
      'cohort': cohort,
      'peerID': peerID,
      'token': token,
      'photoURL': dpurl
    });
  }

  saveUserToken(token) async {
    await Firestore.instance
        .document('/Users/${this.uid}')
        .updateData({
          'token': token,
        })
        .then((val) {})
        .catchError((e) {
          print(e);
        });
  }

  unsaveUserToken() async {
    await Firestore.instance
        .document('/Users/${this.uid}')
        .updateData({
          'token': '',
        })
        .then((val) {})
        .catchError((e) {
          print(e);
        });
  }

  getEvents() async {
    return await Firestore.instance.collection("Events").getDocuments();
  }

  getCurrentCollectionData(collectionName) async {
    return await Firestore.instance.collection(collectionName).getDocuments();
  }

  getTodaysDeadlines(date) async {
    return await Firestore.instance
        .collection("Deadlines")
        .document(date)
        .collection("Listed")
        .getDocuments();
  }

  getPeerToken(String userID) async {
    return await Firestore.instance.collection("Users").document(userID).get();
  }

  getUserData() async {
    return await Firestore.instance
        .collection("Users")
        .document(this.uid)
        .get();
  }

  getConversationMessages(String chatRoomID) async {
    return await Firestore.instance
        .collection("ChatRoom")
        .document(chatRoomID)
        .collection("chats")
        .orderBy("time", descending: false)
        .snapshots();
  }

  createChatRoom(String chatRoomID, chatRoomMap) {
    Firestore.instance
        .collection("ChatRoom")
        .document(chatRoomID)
        .setData(chatRoomMap)
        .catchError((e) {
      print(e.toString());
    });
  }

  addConversationMessage(String chatRoomID, messageMap) {
    Firestore.instance
        .collection("ChatRoom")
        .document(chatRoomID)
        .collection("chats")
        .add(messageMap)
        .catchError((e) {
      print(e.toString());
    });
  }

  getPeerData(String peerID) async {
    return await Firestore.instance.collection("Users").document(peerID).get();
  }

  Future<DocumentReference> addResource(collectionName, title, link) async {
    Map<String, String> resourceMap = {"Title": title, "Link": link};
    return await Firestore.instance
        .collection(collectionName)
        .add(resourceMap)
        .catchError((e) {
      print(e.toString());
    });
  }

  void addDeadline(date, title, link) async {
    Map<String, String> deadlineMap = {"Title": title, "Link": link};
    await Firestore.instance
        .collection("Deadlines")
        .document(date.toIso8601String())
        .setData({"data": date});
    return await Firestore.instance
        .collection("Deadlines")
        .document(date.toIso8601String())
        .collection("Listed")
        .document()
        .setData(deadlineMap)
        .catchError((e) {
      print(e.toString());
    });
  }

  getUserPeers(String userid) async {
    var result = await Firestore.instance
        .collection("Users")
        .document(userid)
        .snapshots();
    return result;
  }

  Future<dynamic> getUserFromID(String userID) async {
    dynamic doc =
        await Firestore.instance.collection("Users").document(userID).get();
    var data = await doc.data;
    Map<String, String> rv = {
      "name": data["name"],
      "profilePic": data["photoURL"]
    };
    return rv;
  }

  Future<Map<DateTime, List<dynamic>>> mapDeadlines() async {
    var p = await Firestore.instance.collection('Deadlines').getDocuments();

    Map<DateTime, List<dynamic>> mapped = {};
    if (p.documents.length == null) return mapped;
    for (int i = 0; i < p.documents.length; i++) {
      var events =
          await getTodaysDeadlines(p.documents[i].documentID.toString());
      List<dynamic> pairs = [];
      events.documents.forEach((ev) {
        pairs.add([ev.data["Title"], ev.data["Link"]]);
      });
      String key = p.documents[i].documentID.toString();
      mapped[DateTime.parse(key)] = pairs;
    }

    return mapped;
  }
}
