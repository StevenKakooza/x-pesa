//User Model
class User {
  int uid;
  String userImage;
  String userName;
  double creditScore;
  String userUniversity;
  String studentNo;
  int verified;
  String regNo;
  List<String> phoneNumber;
  String email;
  DateTime dob;
  String password;
  List<String> nOk;
  String accNo;
  User(
      {this.uid,
      this.userImage,
      this.userName,
      this.creditScore,
      this.userUniversity,
      this.studentNo,
      this.verified,
      this.regNo,
      this.phoneNumber,
      this.email,
      this.dob,
      this.password,
      this.nOk,
      this.accNo});
}

List<User> users = [
  User(
      accNo: 'USFP001',
      creditScore: 53,
      dob: DateTime.utc(1999, 01, 13),
      email: 'nzekakooza@gmail.com',
      phoneNumber: ['+256772053630'],
      regNo: '18/U/0147/U',
      studentNo: '11804270885',
      userImage: 'assets/images/2.jpg',
      userName: 'Steven Kakooza',
      userUniversity: 'Lira University',
      verified: 1)
];

//Transaction Model
class Transaction {
  double tAmount;
  String tType;
  int tStatus;
  String tDate;
  int tDay;

  Transaction({this.tAmount, this.tDate, this.tStatus, this.tType, this.tDay});
}

List<Transaction> transactions = [
  Transaction(
      tAmount: 3000, tDate: 'Apr', tStatus: 0, tType: 'Saving', tDay: 1),
  Transaction(
      tAmount: 5000, tDate: 'Mar', tStatus: 0, tType: 'Saving', tDay: 1),
  Transaction(
      tAmount: 3000, tDate: 'Mar', tStatus: 0, tType: 'Saving', tDay: 2),
  Transaction(tAmount: 50000, tDate: 'Mar', tStatus: 1, tType: 'Loan', tDay: 4),
  Transaction(
      tAmount: 10000, tDate: 'Mar', tStatus: 0, tType: 'Saving', tDay: 3),
  Transaction(tAmount: 3000, tDate: 'Apr', tStatus: 1, tType: 'Loan', tDay: 2),
];
