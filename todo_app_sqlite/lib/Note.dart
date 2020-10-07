class Note {
  int _id, _priority;
  String _title, _description, _date;

  Note(this._title, this._date, this._priority, [this._description]);

  Note.withId(this._id, this._title, this._date, this._priority,
      [this._description]);

//All the Getters
  int get id {
    return _id;
  }

  int get priority => _priority;
  String get title => _title;
  String get description => _description;
  String get date => _date;

//All the Setters
  set title(String newTitle) {
    if (newTitle.length <= 255) this._title = newTitle;
  }

  set description(String newDescription) {
    if (newDescription.length <= 255) this._description = newDescription;
  }

  set date(String newDate) {
    if (newDate.length <= 255) this._date = newDate;
  }

  set priority(int newPre) {
    if (newPre >= 1 && newPre <= 2) this._priority = newPre;
  }

//Save and Retriving from the Database

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    if (id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['description'] = _description;
    map["priority"] = _priority;
    map['date'] = _date;
    return map;
  }

  Note.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._title = map['title'];
    this._description = map['description'];
    this._priority = map['priority'];
    this._date = map['date'];
  }
}
