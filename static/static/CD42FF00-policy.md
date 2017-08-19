<h1 id="policy">OpenPGP keysigning policy</h1>

_This policy is available in both [HTML](http://diti.me/pgp/#policy) and
[signed Markdown](http://diti.me/static/CD42FF00-policy.md.asc)._

I, Dimitri Torterat (Diti), am willing to sign (= certify) the following categories of public keys:

* Personal
* Corporate
* Pseudonymous

I am the owner of the following public key:

    pub   4096R/CD42FF00 2013-05-14
      Key fingerprint = FD4F 1D56 6452 19A0 C6F6  F9AB 31A4 9121 CD42 FF00

I live in the Paris area. _Always_ available for keysigning.

## IRL identity check

An OpenPGP certification is all about verifying that the person I met is also the owner of the key I am signing. I will thus _refuse_ to sign your key if you don't provide some kind of identification.

## OpenPGP identity check

Once I have verified your IRL identity, I will send a first batch of e-mails to you, with "default" levels (see next section).

On a secure Linux machine, I sign your key with GnuPG like so:

    gpg --ask-cert-level \
        --cert-policy-url http://diti.me/pgp/#policy \
        --cert-notation CD42FF00@diti.me=http://diti.me/pgp/certs/%f.notes.asc \
        --sign-key <ID>

### Signature levels

The `ask-cert-level` option allows me to tell the keyservers how carefully I have verified your IRL identity, and certified your OpenPGP identity.

I will most of the time sign with level 2.

<dl>
  <dt id="cert-level-0">Level 0 (private)</dt>
  <dd>The weakest in my web of trust; does not convey information about how carefully I checked identities. Only for signees who _explicitly ask for it._</dd>

  <dt id="cert-level-1">Level 1 (incomplete)</dt>
  <dd>For UIDs I have _checked, but not fully validated._</dd>

  <dt id="cert-level-2">Level 2 (standard)</dt>
  <dd>The default level I sign keys with. For UIDs I have _casually checked._</dd>

  <dt id="cert-level-3">Level 3 (extended)</dt>
  <dd>The strongest in my web of trust. For UIDs I have _**very carefully** checked._</dd>
</dl>

My **default** signature level depends on the type of UID.  
Example cases:

* `Full Name` => just a name, matches your French government-issued ID => level 3
* `Full Name` => just a name, matches a government-issued ID I can't fully validate => level 2
* `Full name (<birthdate>)` => just information available on your ID => level 3 or 2
* `Full Name (I love pizza)` => I cannot _fully_ confirm this info => level 1
* `Full Name <mail@example.org>` => should test e-mail validity => level 1 or 2
* `[jpeg image of size 1337]` => unless I can verify your photo live => level 1

To get a level 0 or a level 3 signature, please ask me.

## Changelog

* 2014-04-02: First version. "Simplified" explanation of the identity check process, of signature levels (with example default cases). Changelog section.
