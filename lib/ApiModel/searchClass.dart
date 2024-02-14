class Sample {
  String? sId;
  String? audioTitle;
  String? audioUpload;
  String? banner;
  List<Category>? category;
  List<Language>? language;
  List<Author>? author;
  String? uploadedAt;
  String? description;
  int? duration;

  Sample(
      {this.sId,
        this.audioTitle,
        this.audioUpload,
        this.banner,
        this.category,
        this.language,
        this.author,
        this.uploadedAt,
        this.description,
        this.duration});

  Sample.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    audioTitle = json['audio_title'];
    audioUpload = json['audio_upload'];
    banner = json['banner'];
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(new Category.fromJson(v));
      });
    }
    if (json['language'] != null) {
      language = <Language>[];
      json['language'].forEach((v) {
        language!.add(new Language.fromJson(v));
      });
    }
    if (json['author'] != null) {
      author = <Author>[];
      json['author'].forEach((v) {
        author!.add(new Author.fromJson(v));
      });
    }
    uploadedAt = json['UploadedAt'];
    description = json['description'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['audio_title'] = this.audioTitle;
    data['audio_upload'] = this.audioUpload;
    data['banner'] = this.banner;
    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
    }
    if (this.language != null) {
      data['language'] = this.language!.map((v) => v.toJson()).toList();
    }
    if (this.author != null) {
      data['author'] = this.author!.map((v) => v.toJson()).toList();
    }
    data['UploadedAt'] = this.uploadedAt;
    data['description'] = this.description;
    data['duration'] = this.duration;
    return data;
  }
}

class Category {
  String? sId;
  String? categoryName;
  String? categoryImage;

  Category({this.sId, this.categoryName, this.categoryImage});

  Category.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    categoryName = json['category_name'];
    categoryImage = json['category_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['category_name'] = this.categoryName;
    data['category_image'] = this.categoryImage;
    return data;
  }
}

class Language {
  String? sId;
  String? languageName;
  String? languageImage;

  Language({this.sId, this.languageName, this.languageImage});

  Language.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    languageName = json['language_name'];
    languageImage = json['language_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['language_name'] = this.languageName;
    data['language_image'] = this.languageImage;
    return data;
  }
}

class Author {
  SocialMedia? socialMedia;
  String? sId;
  String? authorName;
  String? authorProfilePicture;

  Author(
      {this.socialMedia, this.sId, this.authorName, this.authorProfilePicture});

  Author.fromJson(Map<String, dynamic> json) {
    socialMedia = json['social_media'] != null
        ? new SocialMedia.fromJson(json['social_media'])
        : null;
    sId = json['_id'];
    authorName = json['author_name'];
    authorProfilePicture = json['author_profile_picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.socialMedia != null) {
      data['social_media'] = this.socialMedia!.toJson();
    }
    data['_id'] = this.sId;
    data['author_name'] = this.authorName;
    data['author_profile_picture'] = this.authorProfilePicture;
    return data;
  }
}

class SocialMedia {
  String? linkedin;
  String? instagram;
  String? gmail;
  String? facebook;

  SocialMedia({this.linkedin, this.instagram, this.gmail, this.facebook});

  SocialMedia.fromJson(Map<String, dynamic> json) {
    linkedin = json['linkedin'];
    instagram = json['instagram'];
    gmail = json['gmail'];
    facebook = json['facebook'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['linkedin'] = this.linkedin;
    data['instagram'] = this.instagram;
    data['gmail'] = this.gmail;
    data['facebook'] = this.facebook;
    return data;
  }
}
