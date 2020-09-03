# OpenPGP

Library for using openPGP in dart based framework apps auch as Flutter (iOS, android, desktop, web) and Hover

## Usage

```dart
import 'package:openpgp/key_options.dart';
import 'package:openpgp/key_pair.dart';
import 'package:openpgp/openpgp.dart';
import 'package:openpgp/options.dart';

var keyPair = await OpenPGP.generate(
      options: Options(
        name: 'test',
        comment: 'test',
        email: 'test@test.com',
        passphrase: "123456",
        keyOptions: KeyOptions(
            rsaBits: 2048,
            cipher: Cypher.aes128,
            compression: Compression.none,
            hash: Hash.sha256,
            compressionLevel: 0,
        ),
      ),
);

// encrypt a message
var encrypted = await OpenPGP.encrypt("text","[publicKey here]");

// decrypt a message (optionally with a passphrase)
var decrypted = await OpenPGP.decrypt("text encrypted","[privateKey here]","[passphrase here]");

// sign a message (optionally with a passphrase)
var signed = await OpenPGP.sign("text","[publicKey here]","[privateKey here]","[passphrase here]");

// verify a signed message
var verified = await OpenPGP.verify("text signed","text","[publicKey here]");

// symmetrically encrypt a message with a passphrase
var encryptedSymmetric = await OpenPGP.encryptSymmetric("text","[passphrase here]");

// symmetrically dencrypt a message with a passphrase
var decryptedSymmetric = await OpenPGP.decryptSymmetric("text encrypted","[passphrase here]");

```

## ProGuard

Add this lines to `proguard-rules.pro` for proguard support

```proguard
-keep class go.** { *; }
-keep class openpgp.** { *; }
```

## Sample

Inside example folder

```bash
cd example && flutter run
```

## Native Code

the native library is made in Golang and build with gomobile for faster performance

https://github.com/jerson/openpgp-mobile
