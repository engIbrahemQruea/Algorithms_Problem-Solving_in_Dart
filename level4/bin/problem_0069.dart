abstract class Mobile {
  void dail(String phoneNumber);
  void sendSMS(String phoneNumber, String text);
  void takePicture();
}

class Iphone extends Mobile {
  @override
  void dail(String phoneNumber) {
    // TODO: implement dail
  }

  @override
  void sendSMS(String phoneNumber, String text) {
    // TODO: implement sendSMS
  }
  
  @override
  void takePicture() {
    // TODO: implement takePicture
  }


}

void main() {
  final iph = Iphone();

}
