/*
   YARA Rule Set
   Author: HuskyHacks | Taggart Institute Red Team Engineer
   Date: 2022-10-14
   Identifier: sample
   Reference: Rusty Recon Bot
*/

/* Rule Set ----------------------------------------------------------------- */

rule rusty_recon_bot {
   meta:
      description = "sample - file rusty-recon-bot"
      author = "HuskyHacks | Taggart Institute Red Team Engineer"
      reference = "Rusty Recon Bot"
      date = "2022-10-14"
      hash1 = "a09412b34c2bebc0fd0b5a9b2819559fc3e199ba86e3da4328ad3d3e0fefb3f3"
   strings:
      $x1 = " <unknown status code>InvalidStatusCodeinvalid status codedescription() is deprecated; use DisplayNetwork Authentication Require" ascii
      $x2 = "trailersHttpInfox-frame-optionsx-dns-prefetch-controlx-content-type-optionswarningviaexecupgrade-insecure-requestsupgradeuser-ag" ascii
      $x3 = "`async fn` resumed after completionassertion failed: DEFAULT_MAX_FRAME_SIZE as usize <= val && val <= MAX_MAX_FRAME_SIZE as usiz" ascii
      $x4 = "stream error PROTOCOL_ERROR -- could not parse content-length; stream=stream error REQUEST_HEADER_FIELDS_TOO_LARGE -- recv_heade" ascii
      $x5 = "assertion failed: !frame.is_ack()/home/husky/.cargo/registry/src/github.com-1ecc6299db9ec823/h2-0.3.14/src/proto/settings.rsFiel" ascii
      $x6 = "/home/husky/.cargo/registry/src/github.com-1ecc6299db9ec823/hyper-0.14.20/src/error.rshttp2 errorerror shutting down connectione" ascii
      $x7 = "user error: connection error received: connection error detected: connection error sent by user:  ()stream error received: strea" ascii
      $x8 = " - UnsupportederrorCustomUncategorizedOtherOutOfMemoryUnexpectedEofInterruptedArgumentListTooLongFilenameTooLongTooManyLinksCros" ascii
      $x9 = "https://RequestBuilderBadSchemeUrlschemequery/home/husky/.cargo/registry/src/github.com-1ecc6299db9ec823/url-2.3.1/src/lib.rsFie" ascii
      $x10 = "\\0\\t\\r\\n\"description() is deprecated; use Display/home/husky/.cargo/registry/src/github.com-1ecc6299db9ec823/h2-0.3.14/src/" ascii
      $x11 = "x-frame-optionsx-dns-prefetch-controlx-content-type-optionswarningviaupgrade-insecure-requestsupgradeuser-agenttransfer-encoding" ascii
      $x12 = "User-Agent: tunnel to  using basic authProxy-Authorization: proxy headers too long for tunnelproxy authentication requiredunsucc" ascii
      $x13 = "tokio_util::codec::framed_impl/home/husky/.cargo/registry/src/github.com-1ecc6299db9ec823/tokio-util-0.7.4/src/codec/framed_impl" ascii
      $x14 = "/home/husky/.cargo/registry/src/github.com-1ecc6299db9ec823/tokio-1.21.2/src/runtime/io/mod.rsi/o driver event store missingfail" ascii
      $x15 = ":status:protocol:path:scheme:method:authorityPATCHCONNECTTRACEPathnameDELETEPUTGETOPTIONS100101102103104105106107108109110111112" ascii
      $x16 = "/home/husky/.cargo/registry/src/github.com-1ecc6299db9ec823/indexmap-1.9.1/src/map/core.rsindex not foundGOAWAY stream IDs shoul" ascii
      $x17 = ":split always has at least 1 itemparsing should validate brackets/rustc/9d1b2106e23b1abd32fce1f17267604a5102f57a/library/core/sr" ascii
      $x18 = "TYrecv HEADERSrecv DATAcodec closedmutex poisonedinvalid GOAWAY frame/home/husky/.cargo/registry/src/github.com-1ecc6299db9ec823" ascii
      $x19 = "CHUNK_SIZE_MAX_BYTES should fit any usize/home/husky/.cargo/registry/src/github.com-1ecc6299db9ec823/hyper-0.14.20/src/proto/h1/" ascii
      $x20 = "attempt to divide by zeroInvalid ELF section name offsetInvalid ELF section size or offset/rustc/9d1b2106e23b1abd32fce1f17267604" ascii
      /* Adding the imprint string for this binary as an additional rule */
      $x21 = "c2edd8a89c77c6f33b6cb949615b78c1" ascii
  condition:
      uint16(0) == 0x457f and filesize < 7000KB and
      1 of ($x*)
}

