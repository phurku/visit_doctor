import 'package:cloud_firestore/cloud_firestore.dart';


 
class FirestoreProvider{
  Firestore _store=Firestore.instance;

  Stream<QuerySnapshot>getItems(){
    return _store.collection('patientlist').snapshots();

  }
  
  Future<DocumentReference> addItems(Map<String, dynamic>item){
    return _store.collection('patientlist').add(item);
    }
  Future<void> updateItem(String id, Map item){
    return _store.collection('patientlist').document(id).setData(item);
  }
 void delete(id){
   _store.collection('patientlist').document(id).delete();
 }
}


