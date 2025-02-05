import 'package:encrypt/encrypt.dart' as encrypt;
import 'dart:convert';
import 'dart:typed_data';

final key = encrypt.Key.fromUtf8('My32charSecurePasswordKey!123456');

encryptPassword(String password) {
  final iv = encrypt.IV.fromLength(16); // Generate a new IV each time
  final encrypter = encrypt.Encrypter(encrypt.AES(key));

  final encrypted = encrypter.encrypt(password, iv: iv);

  // Store IV + Encrypted Password as Base64
  final combined = base64.encode(iv.bytes + encrypted.bytes);
  return combined;
}

String decryptPassword(String encryptedPassword) {
  final encrypter = encrypt.Encrypter(encrypt.AES(key));

  // Decode from Base64
  final decoded = base64.decode(encryptedPassword);

  // Extract IV (First 16 bytes) and Encrypted Data (Rest)
  final iv = encrypt.IV(Uint8List.fromList(decoded.sublist(0, 16)));
  final encryptedData =
      encrypt.Encrypted(Uint8List.fromList(decoded.sublist(16)));

  // Decrypt using extracted IV
  return encrypter.decrypt(encryptedData, iv: iv);
}
