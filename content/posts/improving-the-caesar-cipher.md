---
title: "Improving the Caesar Cipher"
date: 2025-05-22
draft: false
toc: false
images:
tags:
  - cybersecurity
  - encryption
---

---

## Introduction

The *Caesar Cipher* is one of the earliest methods of encryption, dating back
 to the Roman Empire, where each letter in the plaintext is replaced by letter
 some fixed number of positions (called the *shift key*) down the alphabet. For
 example, with a key of *5*, `A` becomes `F`, `B` becomes `G`, and `C` becomes
 `H`.

With only 25 possible keys, and each letter always being shifted by the same
 amount, this basic cipher is easily broken with brute force. However, this
 method can be improved upon while still retaining its core principle of
 substitution.

Let’s explore this concept in the context of military communications in the
 Roman Empire, and the Confidentiality, Integrity, and Availability triad of
 modern cybersecurity.

---

## Polyalphabetic Substitution

Enter *Polyalphabetic Substitution*, also known as the *Vigenère Cipher*.

Rather than a single key, polyalphabetic substitution makes use of a *keyword*
 that determines a sequence of shifts starting with `A = 0`. For example,
 using the keyword `SECURE` would translate to shifts of 18, 4, 2, 20, 17, and
 4. The message is encrypted letter-by-letter, cycling through the keyword to
 determine the next shift.

This method eliminates the frequency analysis vulnerability in the original
 cipher, improving confidentiality and integrity by making the message much
 more difficult to decode or modify without knowing the the keyword. It makes
 real the possibility of using a different, secure keyword for each trusted
 Legatus in the empire’s ranks, helping prevent message forgery.

Little effect is had on availability versus the Caesar Cipher, by way that a
 keyword is just as easily memorized as a shift key.

---

## Randomized Substitution Alphabet

Instead of shifting letters, we can create a randomized substitution alphabet,
 shared secretly between sender and receiver. In this method, each plaintext
 letter maps directly to a unique letter in the randomized cipher alphabet,
 increasing entropy and preventing pattern recognition.

This is a similar boon to confidentiality and integrity as Polyalphabetic
 Substitution, and again allows for the possibility of using a different,
 secure key for each trusted Legatus. However, there is a caveat with this
 method – a randomized alphabet is not easily memorized, and thus must be
 written down. The implications being that your pre-shared key could be lost
 or destroyed, compromising availability, or stolen, compromising
 confidentiality and integrity.

---

## Time-Based Key Variation

If we’re operating under the assumption that messages have unencrypted
 metadata, such as the sending date, we can incorporate that as a way to
 ensure the key changes over time, preventing reuse and reducing the potential
 impact of a cipher being brute-forced.

For example, we could introduce an additional shift simply based on the month
 of year (1-12). We could go even further and subtract the day (1-31) from
 the months (1-12), shifting left on a negative result, right on a positive
 result, or not at all on a result of zero.

Again, this is a similar boon for confidentiality and integrity, but has a
 potential implication for availability in that the date portion of the message
 needs to be intact in order to successfully decode it, while with other
 methods a partial message could still be decoded by the intended recipient.

---

## Hands-On Exercise

In this exercise, you're a trusted Legatus of the Roman Empire, and you've
 received an urgent communication containing an encrypted passphrase.

The password is encrypted using a time-based polyalphabetic cipher, using the
 keyword `CAESAR`, and the date of this publication (Thurs. May 22, 2025).

The ciphertext is: `ovirmqwzqrtq`

### Instructions

Begin by subtracting the day (1-31) from the month (1-12) and take the absolute
 value, modulo 26. This is your time-shift key.

Then, in any order:

- [Decrypt the time shifted layer](https://caesar-cipher.com/), using the
  time-shift key and the regular Caesar Cipher method.

- [Decrypt the polyalphabetic layer](https://www.dcode.fr/vigenere-cipher),
  using the keyword `CAESAR`. Note: Use the *Decrypt* button, not the
  *Automatic Decryption* button, which returns garbage.

Finally, capitalize the first letter of each word in the resultant string
 (hint: it's in Latin).

Congratulations, Legatus! You've successfully decrypted the passphrase!

---

## Conclusion

Combining all three methods would significantly improve the security over the
 original Caesar Cipher, ensuring that we can securely communicate securely and
 effectively throughout our empire’s ranks. Using a randomized alphabet and
 polyalphabetic shift sequence, and then again shifting the result of that
 based on the sending date, we would make brute-force decryption extremely
 difficult.

By combining something the recipient has (the randomized alphabet) with
 something they know (their unique keyword), we’ve essentially implemented
 Multi-Factor Authentication, and it’s extremely unlikely that anybody except
 the intended Legatus, or the Emperor himself, would be able to read the
 messages.
