import 'dart:convert';


///CommentModel class Contains Individual Comment object Model(Comment is a review or statement provided by Consumers to that store)
///Contains 4 fields, commentorName - name of the consumer who wrote the Comment, photo- profile photo of the consumer who wrote the comment
///, time - Time at which the comment was published by consumer, comment - the actual Comment that the consumer wrote
class CommentModel {
  CommentModel({
    required this.commentorName,
    required this.photo,
    required this.time,
    required this.comment,
  });

  String commentorName;
  dynamic photo;
  String time;
  String comment;

  /// Factory of converting raw JSON string to the CommentModel elements
  factory CommentModel.fromRawJson(String str) =>
      CommentModel.fromJson(json.decode(str));

  /// Method of converting Model into Raw JSON String
  String toRawJson() => json.encode(toJson());

  /// Factory for converting individual JSON object into CommentModel object
  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        commentorName:
            json["CommentorName"],
        photo: json["Photo"],
        time: json["Time"],
        comment: json["Comment"],
      );

  /// Converting individual CommentModel object to a JSON object
  Map<String, dynamic> toJson() => {
        "CommentorName": commentorName,
        "Photo": photo,
        "Time": time,
        "Comment": comment,
      };
}
