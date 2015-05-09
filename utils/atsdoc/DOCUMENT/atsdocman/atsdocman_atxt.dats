(*
atsdocman.atxt: 1(line=1, offs=1) -- 84(line=6, offs=3)
*)

(*
** Author: Hongwei Xi (hwxi AT cs DOT bu DOT edu)
** Time: August, 2011
*)

(*
atsdocman.atxt: 86(line=8, offs=1) -- 275(line=17, offs=3)
*)

//
dynload "libatsdoc/dynloadall.dats"
//
staload "libatsdoc/SATS/libatsdoc_atext.sats"
//
dynload "utils/atsyntax/DATS/ats2xhtml.dats"
staload "utils/atsyntax/SATS/ats2xhtml.sats"
//

(*
atsdocman.atxt: 277(line=19, offs=1) -- 2891(line=143, offs=3)
*)


val LT = "<"
val LTSLASH = "</"
val GT = ">"

val COMMENTopn = atext_strcst"<!--"
and COMMENTcls = atext_strcst("-->")

fun xmltagging (
  tag: string, x: string
) : atext = let
  val _opn = atext_appstr3 (LT, tag, GT)
  val _cls = atext_appstr3 (LTSLASH, tag, GT)
in
  atext_apptxt3 (_opn, atext_strsub(x), _cls)
end // end of [xmltagging]

macdef para (x) = xmltagging ("P", ,(x)) // paragraph
macdef command (x) = xmltagging ("B", ,(x)) // boldfaced
macdef emph (x) = xmltagging ("I", ,(x)) // italic

(* ****** ****** *)

local

val _opn =
  atext_strcst"<PRE class=\"textpre\">"
val _cls = atext_strcst"</PRE>"

in // in of [local]

fn textpre
  (x: string): atext =
  atext_apptxt3 (_opn, atext_strsub(x), _cls)
// end of [textpre]

end // end of [local]

(* ****** ****** *)

local

val _opn =
  atext_strcst"<span class=\"code\">"
val _cls = atext_strcst"</span>"

in // in of [local]

fn code (x: string): atext = 
  atext_apptxt3 (_opn, atext_strsub(x), _cls)
// end of [code]

end // end of [local]

(* ****** ****** *)

fun ignore (x: string): atext = atext_nil ()

fun comment (x: string): atext =
  atext_apptxt3 (COMMENTopn, atext_strsub(x), COMMENTcls)
// end of [comment]

fun sub2str
  (sub: string): string = let
  val strp = tostring_strsub (sub)
in
  if strptr_isnot_null (strp) then string_of_strptr (strp)
  else let
    val () = strptr_free (strp) in ""
  end (* end of [if] *)
end // end of [sub2str]

(* ****** ****** *)

fun ats2xhtmls
  (x: string): atext =
  atext_strptr0 (ats2xhtml_strcode (0, x))
fun ats2xhtmld
  (x: string): atext =
  atext_strptr0 (ats2xhtml_strcode (1, x))

fun ats2xhtmlss
  (x: string): atext =
  atext_strptr0 (ats2xhtml_strcode (0, sub2str x))
fun ats2xhtmldd
  (x: string): atext =
  atext_strptr0 (ats2xhtml_strcode (1, sub2str x))

(* ****** ****** *)

fun DQ () = atext_strcst ("\"")

fun copy (x: string): atext = atext_strcst (x)

fun atslink (): atext =
  atext_strcst "<a href=\"http://www.ats-lang.org/\">ATS</a>"
// end of [atslink]

#define MYDOCROOT "../../DOCUMENT"
#define MYIMPROOT "../../IMPLEMENT"

fun mydoclink (
  codepath: string, linkname: string
) : atext = let
  val res = sprintf (
    "<a href=\"%s/atsdocman/%s\">%s</a>", @(MYDOCROOT, codepath, linkname)
  ) // end of [val]
in
  atext_strptr (res)
end // end of [mydoclink]

fun myatsimplink (
  codepath: string, linkname: string
) : atext = let
  val res = sprintf (
    "<a href=\"%s/Anairiats/%s\">%s</a>", @(MYIMPROOT, codepath, linkname)
  ) // end of [val]
in
  atext_strptr (res)
end // end of [myatsimplink]

macdef filename(x) = xmltagging ("I", ,(x)) // italic


(*
atsdocman.atxt: 2894(line=145, offs=2) -- 3964(line=169, offs=3)
*)
val __tok1 = copy("\
<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\"
\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">
<html xmlns=\"http://www.w3.org/1999/xhtml\">
<head>
  <title></title>
  <meta http-equiv=\"Content-Type\" content=\"text/html;charset=utf-8\"/>
  <style type=\"text/css\">
    .code {color:#E80000;}
    .atsyntax {color:#E80000;background-color:#E0E0E0;}
    .atsyntax span.comment {color:#787878;font-style:italic;}
    .atsyntax span.extern  {color:#A52A2A;}
    .atsyntax span.keyword {color:#000000;font-weight:bold;}
    .atsyntax span.neuexp  {color:#800080;}
    .atsyntax span.staexp  {color:#0000FF;}
    .atsyntax span.dynexp  {color:#E80000;}
    .atsyntax span.prfexp  {color:#009000;}
    .atsyntax span.stacstdec  {text-decoration:none;}
    .atsyntax span.stacstuse  {color:#0000CF;text-decoration:underline;}
    .atsyntax span.dyncstdec  {text-decoration:none;}
    .atsyntax span.dyncstimp  {color:#B80000;text-decoration:underline;}
    .atsyntax span.dyncstuse  {color:#B80000;text-decoration:underline;}
  </style>
</head>
")
val () = theAtextMap_insert_str ("__tok1", __tok1)

(*
atsdocman.atxt: 3965(line=169, offs=4) -- 3980(line=169, offs=19)
*)
val __tok2 = comment("copy")
val () = theAtextMap_insert_str ("__tok2", __tok2)

(*
atsdocman.atxt: 3990(line=173, offs=1) -- 4147(line=179, offs=3)
*)

fun HR (sz: int): atext = let
  val res = sprintf ("<HR SIZE=%i ALIGN=LEFT></HR>", @(sz))
in
  atext_strcst (string_of_strptr (res))
end // end of [HR]

(*
atsdocman.atxt: 4167(line=183, offs=2) -- 4172(line=183, offs=7)
*)
val __tok3 = HR(2)
val () = theAtextMap_insert_str ("__tok3", __tok3)

(*
atsdocman.atxt: 4175(line=185, offs=2) -- 4201(line=185, offs=28)
*)
val __tok4 = comment(" ****** ****** ")
val () = theAtextMap_insert_str ("__tok4", __tok4)

(*
atsdocman.atxt: 4226(line=189, offs=14) -- 4243(line=189, offs=31)
*)
val __tok6 = command("atsdoc")
val () = theAtextMap_insert_str ("__tok6", __tok6)

(*
atsdocman.atxt: 4261(line=189, offs=49) -- 4270(line=189, offs=58)
*)
val __tok7 = atslink()
val () = theAtextMap_insert_str ("__tok7", __tok7)

(*
atsdocman.atxt: 4307(line=190, offs=23) -- 4337(line=190, offs=53)
*)
val __tok8 = emph("texting function calls")
val () = theAtextMap_insert_str ("__tok8", __tok8)

(*
atsdocman.atxt: 4204(line=187, offs=2) -- 4527(line=195, offs=3)
*)
val __tok5 = para("\

The command #__tok6$ is a utility in #__tok7$ for turning a
text file laden with #__tok8$ into one in which
these calls are replaced with the strings represented by their return
values. This utility is designed for people who have some basic knowledge
of programmming in ATS.

")
val () = theAtextMap_insert_str ("__tok5", __tok5)

(*
atsdocman.atxt: 4641(line=203, offs=2) -- 4863(line=208, offs=3)
*)
val __tok10 = textpre("\
funarg    ::= DSTRING | SSTRING | INTEGER | ID | funcall
funarglst ::= /*empty*/ | fuarg | funarg \",\" funarglst
funcall   ::= \"\#\"ID{funres}(funarglst) | \"\#\"ID[funres]{funarglst}
funres    ::= \"[\" ID \"]\"
")
val () = theAtextMap_insert_str ("__tok10", __tok10)

(*
atsdocman.atxt: 4864(line=208, offs=4) -- 4882(line=208, offs=22)
*)
val __tok11 = comment("textpre")
val () = theAtextMap_insert_str ("__tok11", __tok11)

(*
atsdocman.atxt: 5115(line=215, offs=2) -- 5281(line=222, offs=3)
*)
val __tok12 = textpre("\
\#fact(10)
\#timestamp[NOW]()
\#foo(\"\#Hello(\"world\")\")
\#foo(\"\#Hello(\'world\')\")
\#bar(\#version(), 100)
\#foolst{itm1, itm2, itm3}
")
val () = theAtextMap_insert_str ("__tok12", __tok12)

(*
atsdocman.atxt: 4563(line=199, offs=2) -- 5285(line=224, offs=3)
*)
val __tok9 = para("\

The syntax for texting function calls (TFC's) is given as follows:

#__tok10$#__tok11$

where DSTRING and SSTRING are for double-quoted and single-quoted strings,
respectively, and INTEGER is for integers of base 10, and ID is for valid
identifiers in ATS. For instance, following are some syntactically valid
TFC's:

#__tok12$

")
val () = theAtextMap_insert_str ("__tok9", __tok9)

(*
atsdocman.atxt: 5286(line=224, offs=4) -- 5301(line=224, offs=19)
*)
val __tok13 = comment("para")
val () = theAtextMap_insert_str ("__tok13", __tok13)

(*
atsdocman.atxt: 5364(line=229, offs=21) -- 5377(line=229, offs=34)
*)
val __tok15 = emph("atext")
val () = theAtextMap_insert_str ("__tok15", __tok15)

(*
atsdocman.atxt: 5468(line=230, offs=63) -- 5484(line=230, offs=79)
*)
val __tok16 = emph("foo.atxt")
val () = theAtextMap_insert_str ("__tok16", __tok16)

(*
atsdocman.atxt: 5488(line=232, offs=2) -- 5574(line=235, offs=3)
*)
val __tok17 = textpre("\
Author: \#author()
Time of the last modification: \#timestamp[NOW]()
")
val () = theAtextMap_insert_str ("__tok17", __tok17)

(*
atsdocman.atxt: 5336(line=228, offs=2) -- 5577(line=236, offs=3)
*)
val __tok14 = para("\
Let us coin a word #__tok15$ to refer to text laden with
TFC's. Suppose that following is the content of a file named #__tok16$:

#__tok17$
")
val () = theAtextMap_insert_str ("__tok14", __tok14)

(*
atsdocman.atxt: 5578(line=236, offs=4) -- 5593(line=236, offs=19)
*)
val __tok18 = comment("para")
val () = theAtextMap_insert_str ("__tok18", __tok18)

(*
atsdocman.atxt: 5659(line=241, offs=2) -- 5676(line=241, offs=19)
*)
val __tok21 = command("atsdoc")
val () = theAtextMap_insert_str ("__tok21", __tok21)

(*
atsdocman.atxt: 5647(line=240, offs=2) -- 5726(line=242, offs=3)
*)
val __tok20 = textpre("\
#__tok21$ -do foo_atxt.dats -to foo_atxt.txt -i foo.atxt
")
val () = theAtextMap_insert_str ("__tok20", __tok20)

(*
atsdocman.atxt: 5727(line=242, offs=4) -- 5745(line=242, offs=22)
*)
val __tok22 = comment("textpre")
val () = theAtextMap_insert_str ("__tok22", __tok22)

(*
atsdocman.atxt: 5769(line=244, offs=23) -- 5794(line=244, offs=48)
*)
val __tok23 = filename("foo_atxt.dats")
val () = theAtextMap_insert_str ("__tok23", __tok23)

(*
atsdocman.atxt: 5800(line=244, offs=54) -- 5824(line=244, offs=78)
*)
val __tok24 = filename("foo_atxt.txt")
val () = theAtextMap_insert_str ("__tok24", __tok24)

(*
atsdocman.atxt: 5933(line=249, offs=2) -- 5950(line=249, offs=19)
*)
val __tok26 = command("atsdoc")
val () = theAtextMap_insert_str ("__tok26", __tok26)

(*
atsdocman.atxt: 5921(line=248, offs=2) -- 5998(line=250, offs=3)
*)
val __tok25 = textpre("\
#__tok26$ -do foo_atxt.dats -i foo.atxt > foo_atxt.txt
")
val () = theAtextMap_insert_str ("__tok25", __tok25)

(*
atsdocman.atxt: 5999(line=250, offs=4) -- 6017(line=250, offs=22)
*)
val __tok27 = comment("textpre")
val () = theAtextMap_insert_str ("__tok27", __tok27)

(*
atsdocman.atxt: 5596(line=238, offs=2) -- 6021(line=252, offs=3)
*)
val __tok19 = para("\
If we execute the following command-line:
#__tok20$#__tok22$

then two files named #__tok23$ and #__tok24$
are generated. It also possible to do the same thing by executing the
following command-line:

#__tok25$#__tok27$

")
val () = theAtextMap_insert_str ("__tok19", __tok19)

(*
atsdocman.atxt: 6022(line=252, offs=4) -- 6037(line=252, offs=19)
*)
val __tok28 = comment("para")
val () = theAtextMap_insert_str ("__tok28", __tok28)

(*
atsdocman.atxt: 6064(line=255, offs=17) -- 6089(line=255, offs=42)
*)
val __tok30 = filename("foo_atxt.dats")
val () = theAtextMap_insert_str ("__tok30", __tok30)

(*
atsdocman.atxt: 6114(line=257, offs=2) -- 6384(line=269, offs=3)
*)
val __tok31 = ats2xhtmld("\
(*
foo.atxt: 2(line=1, offs=2) -- 12(line=1, offs=12)
*)
val _tok1 = author()
val () = theAtextMap_insert_str (\"_tok1\", _tok1)

(*
foo.atxt: 45(line=2, offs=33) -- 61(line=2, offs=49)
*)
val NOW = timestamp()
val () = theAtextMap_insert_str (\"NOW\", NOW)
")
val () = theAtextMap_insert_str ("__tok31", __tok31)

(*
atsdocman.atxt: 6385(line=269, offs=4) -- 6406(line=269, offs=25)
*)
val __tok32 = comment("ats2xhtmld")
val () = theAtextMap_insert_str ("__tok32", __tok32)

(*
atsdocman.atxt: 6446(line=271, offs=39) -- 6459(line=271, offs=52)
*)
val __tok33 = code("_tok1")
val () = theAtextMap_insert_str ("__tok33", __tok33)

(*
atsdocman.atxt: 6520(line=272, offs=48) -- 6531(line=272, offs=59)
*)
val __tok34 = code("NOW")
val () = theAtextMap_insert_str ("__tok34", __tok34)

(*
atsdocman.atxt: 6595(line=273, offs=50) -- 6620(line=273, offs=75)
*)
val __tok35 = filename("foo_atxt.dats")
val () = theAtextMap_insert_str ("__tok35", __tok35)

(*
atsdocman.atxt: 6040(line=254, offs=2) -- 6675(line=276, offs=3)
*)
val __tok29 = para("\
The content of #__tok30$ is listed as follows:

#__tok31$#__tok32$

Note that the name of the identifier #__tok33$ is generated
automatically while the name of the identifer #__tok34$ is taken from
the input. The embedded location information in #__tok35$
is present primarily for the purpose of debugging.

")
val () = theAtextMap_insert_str ("__tok29", __tok29)

(*
atsdocman.atxt: 6676(line=276, offs=4) -- 6691(line=276, offs=19)
*)
val __tok36 = comment("para")
val () = theAtextMap_insert_str ("__tok36", __tok36)

(*
atsdocman.atxt: 6718(line=279, offs=17) -- 6742(line=279, offs=41)
*)
val __tok38 = filename("foo_atxt.txt")
val () = theAtextMap_insert_str ("__tok38", __tok38)

(*
atsdocman.atxt: 6767(line=281, offs=2) -- 6838(line=284, offs=3)
*)
val __tok39 = textpre("
Author: \#_tok1$
Time of the last modification: \#NOW$
")
val () = theAtextMap_insert_str ("__tok39", __tok39)

(*
atsdocman.atxt: 6839(line=284, offs=4) -- 6857(line=284, offs=22)
*)
val __tok40 = comment("textpre")
val () = theAtextMap_insert_str ("__tok40", __tok40)

(*
atsdocman.atxt: 6891(line=286, offs=33) -- 6915(line=286, offs=57)
*)
val __tok41 = filename("foo_atxt.txt")
val () = theAtextMap_insert_str ("__tok41", __tok41)

(*
atsdocman.atxt: 6694(line=278, offs=2) -- 6995(line=288, offs=3)
*)
val __tok37 = para("\
The content of #__tok38$ is listed as follows:

#__tok39$#__tok40$

Note that each marked token in #__tok41$ is formed
by placing an identifier between the char '\#' and the char '$'.
")
val () = theAtextMap_insert_str ("__tok37", __tok37)

(*
atsdocman.atxt: 7031(line=292, offs=25) -- 7056(line=292, offs=50)
*)
val __tok43 = filename("foo_atxt.dats")
val () = theAtextMap_insert_str ("__tok43", __tok43)

(*
atsdocman.atxt: 7141(line=294, offs=2) -- 7165(line=294, offs=26)
*)
val __tok44 = filename("foo_atxt.txt")
val () = theAtextMap_insert_str ("__tok44", __tok44)

(*
atsdocman.atxt: 7211(line=295, offs=2) -- 7223(line=295, offs=14)
*)
val __tok45 = code("main")
val () = theAtextMap_insert_str ("__tok45", __tok45)

(*
atsdocman.atxt: 7252(line=295, offs=43) -- 7277(line=295, offs=68)
*)
val __tok46 = filename("foo_atxt.dats")
val () = theAtextMap_insert_str ("__tok46", __tok46)

(*
atsdocman.atxt: 7301(line=296, offs=16) -- 7315(line=296, offs=30)
*)
val __tok47 = code("author")
val () = theAtextMap_insert_str ("__tok47", __tok47)

(*
atsdocman.atxt: 7321(line=296, offs=36) -- 7338(line=296, offs=53)
*)
val __tok48 = code("timestamp")
val () = theAtextMap_insert_str ("__tok48", __tok48)

(*
atsdocman.atxt: 7401(line=297, offs=40) -- 7421(line=297, offs=60)
*)
val __tok49 = filename("foo.atxt")
val () = theAtextMap_insert_str ("__tok49", __tok49)

(*
atsdocman.atxt: 6998(line=290, offs=2) -- 7484(line=300, offs=3)
*)
val __tok42 = para("\

The plan is to compile #__tok43$ into an executable that
can generate a text file by replacing each marked token in
#__tok44$ with some text attached to it. However, the
#__tok45$ function is not present in #__tok46$.  Also,
the functions #__tok47$ and #__tok48$ are not available.  By
embedding proper ATS source code into #__tok49$, we can readily
resolve these issues and fulfill the plan.

")
val () = theAtextMap_insert_str ("__tok42", __tok42)

(*
atsdocman.atxt: 7485(line=300, offs=4) -- 7500(line=300, offs=19)
*)
val __tok50 = comment("para")
val () = theAtextMap_insert_str ("__tok50", __tok50)

(*
atsdocman.atxt: 7517(line=304, offs=6) -- 7538(line=304, offs=27)
*)
val __tok52 = filename("foo2.atxt")
val () = theAtextMap_insert_str ("__tok52", __tok52)

(*
atsdocman.atxt: 7577(line=306, offs=2) -- 8205(line=342, offs=3)
*)
val __tok53 = textpre("\
%{
//
dynload \"libatsdoc/dynloadall.dats\"
//
staload \"libatsdoc/SATS/libatsdoc_atext.sats\"
//
%}

%{
fn author () = atext_strcst\"John Doe\"
%}

%{
staload
UN = \"prelude/SATS/unsafe.sats\"
staload TIME = \"libc/SATS/time.sats\"

fn timestamp
  (): atext = let
  var time = $TIME.time_get ()
  val (fpf | x) = $TIME.ctime (time)
  val x1 = sprintf (\"%s\", @($UN.castvwtp1(x)))
  prval () = fpf (x)
  val x1 = string_of_strptr (x1)
in
  atext_strcst (x1)
end // end of [val]
%}

Author: \#author()
Time of the last modification: \#timestamp[NOW]()

%{
implement main () = fprint_filsub (stdout_ref, \"foo2_atxt.txt\")
%}
")
val () = theAtextMap_insert_str ("__tok53", __tok53)

(*
atsdocman.atxt: 8206(line=342, offs=4) -- 8224(line=342, offs=22)
*)
val __tok54 = comment("textpre")
val () = theAtextMap_insert_str ("__tok54", __tok54)

(*
atsdocman.atxt: 8299(line=345, offs=2) -- 8325(line=345, offs=28)
*)
val __tok55 = filename("foo2_atxt.dats")
val () = theAtextMap_insert_str ("__tok55", __tok55)

(*
atsdocman.atxt: 8386(line=348, offs=2) -- 8403(line=348, offs=19)
*)
val __tok57 = command("atsdoc")
val () = theAtextMap_insert_str ("__tok57", __tok57)

(*
atsdocman.atxt: 8374(line=347, offs=2) -- 8454(line=349, offs=3)
*)
val __tok56 = textpre("\
#__tok57$ -do foo2_atxt.dats -i foo2.atxt > foo2_atxt.txt
")
val () = theAtextMap_insert_str ("__tok56", __tok56)

(*
atsdocman.atxt: 8470(line=351, offs=15) -- 8491(line=351, offs=36)
*)
val __tok58 = code("fprint_filsub")
val () = theAtextMap_insert_str ("__tok58", __tok58)

(*
atsdocman.atxt: 8535(line=352, offs=5) -- 8560(line=352, offs=30)
*)
val __tok59 = filename("foo2_atxt.txt")
val () = theAtextMap_insert_str ("__tok59", __tok59)

(*
atsdocman.atxt: 7503(line=302, offs=2) -- 8596(line=354, offs=3)
*)
val __tok51 = para("\

Let #__tok52$ be a file of the following content:

#__tok53$#__tok54$

Any text surrounded by the special symbols '%{' and '%}' is copied into
#__tok55$ after the following command-line is executed:

#__tok56$

The function #__tok58$ is called to replace each marked token
in #__tok59$ with the string attached to it.

")
val () = theAtextMap_insert_str ("__tok51", __tok51)

(*
atsdocman.atxt: 8597(line=354, offs=4) -- 8612(line=354, offs=19)
*)
val __tok60 = comment("para")
val () = theAtextMap_insert_str ("__tok60", __tok60)

(*
atsdocman.atxt: 8642(line=357, offs=21) -- 8668(line=357, offs=47)
*)
val __tok62 = filename("foo2_atxt.dats")
val () = theAtextMap_insert_str ("__tok62", __tok62)

(*
atsdocman.atxt: 8675(line=357, offs=54) -- 8691(line=357, offs=70)
*)
val __tok63 = filename("foo2")
val () = theAtextMap_insert_str ("__tok63", __tok63)

(*
atsdocman.atxt: 8733(line=358, offs=42) -- 8749(line=358, offs=58)
*)
val __tok64 = filename("foo2")
val () = theAtextMap_insert_str ("__tok64", __tok64)

(*
atsdocman.atxt: 8756(line=358, offs=65) -- 8779(line=358, offs=88)
*)
val __tok65 = filename("foo2.output")
val () = theAtextMap_insert_str ("__tok65", __tok65)

(*
atsdocman.atxt: 8783(line=360, offs=2) -- 8855(line=363, offs=3)
*)
val __tok66 = textpre("\
atscc -o foo2 foo2_atxt.dats -latsdoc
./foo2 > foo2.output
")
val () = theAtextMap_insert_str ("__tok66", __tok66)

(*
atsdocman.atxt: 8906(line=365, offs=50) -- 8929(line=365, offs=73)
*)
val __tok67 = filename("foo2.output")
val () = theAtextMap_insert_str ("__tok67", __tok67)

(*
atsdocman.atxt: 8933(line=367, offs=2) -- 9019(line=370, offs=3)
*)
val __tok68 = textpre("\
Author: John Doe
Time of the last modification: Wed Aug 24 20:31:59 2011
")
val () = theAtextMap_insert_str ("__tok68", __tok68)

(*
atsdocman.atxt: 8615(line=356, offs=2) -- 9022(line=371, offs=3)
*)
val __tok61 = para("
We can now compile #__tok62$ into #__tok63$
and then dump the output from executing #__tok64$ into #__tok65$:

#__tok66$

As can be expected, following is the content of #__tok67$:

#__tok68$
")
val () = theAtextMap_insert_str ("__tok61", __tok61)

(*
atsdocman.atxt: 9023(line=371, offs=4) -- 9038(line=371, offs=19)
*)
val __tok69 = comment("para")
val () = theAtextMap_insert_str ("__tok69", __tok69)

(*
atsdocman.atxt: 9100(line=377, offs=16) -- 9114(line=377, offs=30)
*)
val __tok71 = code("author")
val () = theAtextMap_insert_str ("__tok71", __tok71)

(*
atsdocman.atxt: 9120(line=377, offs=36) -- 9137(line=377, offs=53)
*)
val __tok72 = code("timestamp")
val () = theAtextMap_insert_str ("__tok72", __tok72)

(*
atsdocman.atxt: 9218(line=378, offs=58) -- 9230(line=378, offs=70)
*)
val __tok73 = code("text")
val () = theAtextMap_insert_str ("__tok73", __tok73)

(*
atsdocman.atxt: 9254(line=379, offs=23) -- 9344(line=379, offs=113)
*)
val __tok74 = myatsimplink("libatsdoc/SATS/libatsdoc_atext.sats", "libatsdoc/SATS/libatsdoc_atext.sats")
val () = theAtextMap_insert_str ("__tok74", __tok74)

(*
atsdocman.atxt: 9359(line=382, offs=2) -- 10004(line=404, offs=3)
*)
val __tok75 = ats2xhtmls("\
datatype text =
//
  | ATEXTnil of () // empty text
//
  | ATEXTstrcst of string // string constants
  | ATEXTstrsub of string // strings containing marked tokens
//
  | ATEXTapptxt2 of (text, text) // text concatenation
  | ATEXTappstr2 of (string, string) // string concatenation
//
  | ATEXTapptxt3 of (text, text, text) // text concatenation
  | ATEXTappstr3 of (string, string, string) // string concatenation
//
  | ATEXTconcatxt of textlst // text concatenation
  | ATEXTconcatxtsep of (textlst, text(*sep*)) // text concatenation with separator
// end of [text]

where
textlst = List (text)
and
stringlst = List (string)
")
val () = theAtextMap_insert_str ("__tok75", __tok75)

(*
atsdocman.atxt: 10005(line=404, offs=4) -- 10026(line=404, offs=25)
*)
val __tok76 = comment("ats2xhtmls")
val () = theAtextMap_insert_str ("__tok76", __tok76)

(*
atsdocman.atxt: 10099(line=407, offs=2) -- 10111(line=407, offs=14)
*)
val __tok77 = code("text")
val () = theAtextMap_insert_str ("__tok77", __tok77)

(*
atsdocman.atxt: 10148(line=407, offs=51) -- 10167(line=407, offs=70)
*)
val __tok78 = code("ATEXTstrsub")
val () = theAtextMap_insert_str ("__tok78", __tok78)

(*
atsdocman.atxt: 10367(line=410, offs=44) -- 10386(line=410, offs=63)
*)
val __tok79 = code("ATEXTstrsub")
val () = theAtextMap_insert_str ("__tok79", __tok79)

(*
atsdocman.atxt: 10540(line=413, offs=2) -- 10561(line=413, offs=23)
*)
val __tok80 = code("fprint_strsub")
val () = theAtextMap_insert_str ("__tok80", __tok80)

(*
atsdocman.atxt: 10566(line=414, offs=2) -- 10656(line=414, offs=92)
*)
val __tok81 = myatsimplink("libatsdoc/DATS/libatsdoc_atext.dats", "libatsdoc/DATS/libatsdoc_atext.dats")
val () = theAtextMap_insert_str ("__tok81", __tok81)

(*
atsdocman.atxt: 9076(line=375, offs=2) -- 10661(line=416, offs=3)
*)
val __tok70 = para("\

The functions #__tok71$ and #__tok72$ presented above do not
return strings. Instead, they return values of the type #__tok73$,
which is declared in #__tok74$ as
follows:

#__tok75$#__tok76$

The meaning of all the data constructors associated with the datatype
#__tok77$ should be easily understood except #__tok78$, which
indicates that its (string) argument may contain marked tokens, that is,
symbols formed by placing identifiers between the two characters '\#' and
'$'. When stringizing a value of the form #__tok79$(str) for some
string str, we must replace each marked token in str with the string it
represents. For further details, please see the implementation of
#__tok80$ in
#__tok81$.

")
val () = theAtextMap_insert_str ("__tok70", __tok70)

(*
atsdocman.atxt: 10662(line=416, offs=4) -- 10677(line=416, offs=19)
*)
val __tok82 = comment("para")
val () = theAtextMap_insert_str ("__tok82", __tok82)

(*
atsdocman.atxt: 10680(line=418, offs=2) -- 10685(line=418, offs=7)
*)
val __tok83 = HR(2)
val () = theAtextMap_insert_str ("__tok83", __tok83)

(*
atsdocman.atxt: 10710(line=422, offs=14) -- 10738(line=422, offs=42)
*)
val __tok85 = mydoclink("TEST", "on-line")
val () = theAtextMap_insert_str ("__tok85", __tok85)

(*
atsdocman.atxt: 10860(line=424, offs=17) -- 10898(line=424, offs=55)
*)
val __tok86 = mydoclink("atsdocman.atxt", "on-line")
val () = theAtextMap_insert_str ("__tok86", __tok86)

(*
atsdocman.atxt: 10688(line=420, offs=2) -- 10903(line=426, offs=3)
*)
val __tok84 = para("\

Please find #__tok85$ all the files involved in the
above presentation.  The atext file for producing the current html file is
also available #__tok86$.

")
val () = theAtextMap_insert_str ("__tok84", __tok84)

(*
atsdocman.atxt: 10906(line=428, offs=2) -- 10932(line=428, offs=28)
*)
val __tok87 = comment(" ****** ****** ")
val () = theAtextMap_insert_str ("__tok87", __tok87)

(*
atsdocman.atxt: 10935(line=430, offs=2) -- 10971(line=430, offs=38)
*)
val __tok88 = comment(" end of [atsdocman.atxt] ")
val () = theAtextMap_insert_str ("__tok88", __tok88)

(*
atsdocman.atxt: 10990(line=435, offs=1) -- 11064(line=437, offs=3)
*)

implement main () = fprint_filsub (stdout_ref, "atsdocman_atxt.txt")

