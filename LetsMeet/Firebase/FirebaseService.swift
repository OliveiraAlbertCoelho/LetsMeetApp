//
//  FirebaseService.swift
//  LetsMeet
//
//  Created by albert coelho oliveira on 11/26/19.
//  Copyright © 2019 albert coelho oliveira. All rights reserved.
//
import Foundation
import FirebaseFirestore

enum FireStoreCollections: String {
    case users
    case posts
    case channel
}

class FirestoreService {
    static let manager = FirestoreService()
    private let db = Firestore.firestore()
    
    func SaveUser(user: AppUser, completion: @escaping (Result<(), Error>) -> ()) {
        var fields = user.fieldsDict
        fields["dateCreated"] = Date()
        db.collection(FireStoreCollections.users.rawValue).document(user.uid).setData(fields) { (error) in
            if let error = error {
                completion(.failure(error))
                print(error)
            }
            completion(.success(()))
        }
    }
    
    
    func updateCurrentUser(userName: String? = nil, photoURL: URL? = nil, completion: @escaping (Result<(), Error>) -> ()){
        guard let userId = FirebaseAuthService.manager.currentUser?.uid else {
            return
        }
        var updateFields = [String:Any]()
        
        if let user = userName {
            updateFields["userName"] = user
        }
        
        if let photo = photoURL {
            updateFields["photoURL"] = photo.absoluteString
        }
        
        db.collection(FireStoreCollections.users.rawValue).document(userId).updateData(updateFields) { (error) in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
            
        }
    }
    func getUserInfo(id: String,  completion: @escaping (Result<AppUser,Error>) -> ()) {
        db.collection(FireStoreCollections.users.rawValue).document(id).getDocument { (snapshot, error)  in
            if let error = error {
                completion(.failure(error))
            } else if let snapshot = snapshot,
                let data = snapshot.data() {
                let userID = snapshot.documentID
                let user = AppUser(from: data, id: userID)
                if let appUser = user {
                    completion(.success(appUser))
                }
            }
        }
    }
    func getUserFromPost(creatorID: String, completion: @escaping (Result<AppUser,Error>) -> ()) {
        db.collection(FireStoreCollections.users.rawValue).document(creatorID).getDocument { (snapshot, error)  in
            if let error = error {
                completion(.failure(error))
            } else if let snapshot = snapshot,
                let data = snapshot.data() {
                let userID = snapshot.documentID
                let user = AppUser(from: data, id: userID)
                if let appUser = user {
                    completion(.success(appUser))
                }
            }
        }
    }
    func getAllUsers(completion: @escaping (Result<[AppUser], Error>) -> ()){
        db.collection(FireStoreCollections.users.rawValue).getDocuments {(snapshot, error) in
            if let error = error{
                completion(.failure(error))
            }else {
                let users = snapshot?.documents.compactMap({ (snapshot) -> AppUser? in
                    let userID = snapshot.documentID
                    let user = AppUser(from: snapshot.data(), id: userID)
                    return user
                })
                completion(.success(users ?? []))
            }
        }
    }

//     func checkChannel(users: [String], completion: @escaping (Result<(), Error>) -> ()){
//        db.collection(FireStoreCollections.channel.rawValue).whereField("contacts", arrayContains: users).getDocuments { (snapshot, error) in
//            if let snap = snapshot{
//                completion(.success(()))
//            }else {
//               if let error = error{
//                completion(.failure(error))
//                }}
//        }}
    func createPost(post: Post, completion: @escaping (Result<(), Error>) -> ()) {
        var fields = post.fieldsDict
        fields["dateCreated"] = Date()
        db.collection(FireStoreCollections.posts.rawValue).addDocument(data: fields) { (error) in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
   func getAllPost(completion: @escaping (Result<[Post], Error>) -> ()){
        db.collection(FireStoreCollections.posts.rawValue).getDocuments {(snapshot, error) in
            if let error = error{
                completion(.failure(error))
            }else {
                let posts = snapshot?.documents.compactMap({ (snapshot) -> Post? in
                    let postID = snapshot.documentID
                    let post = Post(from: snapshot.data(), id: postID)
                    return post
                })
                completion(.success(posts ?? []))
                }
    }
    }
        private init () {}



}
    //    }
    //    func startMessage(users:[String], message: MessageModel,  completion: @escaping (Result<(), Error>) -> ()){
    //        startChannel(users: users)
    //        let field = message.fieldsDict
    //}
//func startChannel(Channel: ChannelModel,users: [String], completion: @escaping (Result<(), Error>) -> ()){
//var saveChannels: [ChannelModel]?
//db.collection(FireStoreCollections.channel.rawValue).whereField("contacts", arrayContains: users.description).getDocuments { (snapshot, error) in
//    if let error = error{
//        completion(.failure(error))
//    }else {
//        let channels = snapshot?.documents.compactMap({ (snapshot) -> ChannelModel? in
//            let channelID = snapshot.documentID
//            let newChannel = ChannelModel(from: snapshot.data(), id: channelID)
//            return newChannel
//        })
//        saveChannels = channels
//    }
//        guard let checkChannels = saveChannels else{
//            return
//        }
//        if checkChannels.isEmpty{
//            self.db.collection(FireStoreCollections.channel.rawValue).addDocument(data: Channel.fieldsDict)
//        }
//        completion(.success(()))
//    }
//}
