(*
atslangweb_home.atxt: 1(line=1, offs=1) -- 865(line=39, offs=3)
*)

//
dynload "libatsdoc/dynloadall.dats"
//
staload STDIO = "libc/SATS/stdio.sats"
//
(* ****** ****** *)
//
#define ISTEMP 0
//
#include "atslangwebatxt.dats"
//
val _ATSLANGWEBHOME: atext =
  strcst"<strong>Home</strong>"
val () = theAtextMap_insert_str ("ATSLANGWEBHOME", _ATSLANGWEBHOME)
//
(* ****** ****** *)
//
#include "atslangweb_layout.dats"
//
(* ****** ****** *)

val theCSSfilr =
  $STDIO.fopen_ref_exn ("styles/atslangweb_home.css", file_mode_w)
val () = fprintf (theCSSfilr,
  "@import url(%s/styles/atslangweb_temp.css);\n\n", @(ATSLANGWEBROOT)
) // end of [val]
val () = fprintf (theCSSfilr,
  "@import url(%s/styles/atslangweb_jsddm_menu.css);\n\n", @(ATSLANGWEBROOT)
) // end of [val]

fun addcssrule
  (rule: string): atext = let
  val () = fprint_string (theCSSfilr, rule) in atext_nil ()
end // end of [addcssrule]

(* ****** ****** *)
//

(*
atslangweb_home.atxt: 898(line=42, offs=2) -- 917(line=42, offs=21)
*)
val __tok2 = ATSLANGWEBROOTget()
val () = theAtextMap_insert_str ("__tok2", __tok2)

(*
atslangweb_home.atxt: 868(line=41, offs=2) -- 948(line=43, offs=3)
*)
val theStyleSheetLink = strsub("\
#__tok2$/styles/atslangweb_home.css\
")
val () = theAtextMap_insert_str ("theStyleSheetLink", theStyleSheetLink)

(*
atslangweb_home.atxt: 1029(line=48, offs=2) -- 1049(line=48, offs=22)
*)
val __tok5 = mysitelinks2("HOME")
val () = theAtextMap_insert_str ("__tok5", __tok5)

(*
atslangweb_home.atxt: 963(line=46, offs=2) -- 1059(line=50, offs=3)
*)
val thePageHeaderSeparator = strsub("\
<div class=\"Page-mysitelinks\">
#__tok5$
</div>
")
val () = theAtextMap_insert_str ("thePageHeaderSeparator", thePageHeaderSeparator)

(*
atslangweb_home.atxt: 951(line=45, offs=2) -- 1060(line=50, offs=4)
*)
val __tok3 = ignoretxt(thePageHeaderSeparator)
val () = theAtextMap_insert_str ("__tok3", __tok3)

(*
atslangweb_home.atxt: 1063(line=52, offs=2) -- 1145(line=57, offs=3)
*)
val __tok6 = addcssrule("\
#thePageBody-prop {
padding-left: 10px ;
padding-right: 10px ;
}
")
val () = theAtextMap_insert_str ("__tok6", __tok6)

(*
atslangweb_home.atxt: 1258(line=65, offs=9) -- 1296(line=65, offs=47)
*)
val __tok10 = ulink("#what_is_ats", "What is ATS?")
val () = theAtextMap_insert_str ("__tok10", __tok10)

(*
atslangweb_home.atxt: 1251(line=65, offs=2) -- 1297(line=65, offs=48)
*)
val __tok9 = litxt(__tok10)
val () = theAtextMap_insert_str ("__tok9", __tok9)

(*
atslangweb_home.atxt: 1306(line=66, offs=9) -- 1362(line=66, offs=65)
*)
val __tok12 = ulink("#what_is_ats_good_for", "What is ATS good for?")
val () = theAtextMap_insert_str ("__tok12", __tok12)

(*
atslangweb_home.atxt: 1299(line=66, offs=2) -- 1363(line=66, offs=66)
*)
val __tok11 = litxt(__tok12)
val () = theAtextMap_insert_str ("__tok11", __tok11)

(*
atslangweb_home.atxt: 1372(line=67, offs=9) -- 1417(line=67, offs=54)
*)
val __tok14 = ulink("#acknowledgments", "Acknowledgments")
val () = theAtextMap_insert_str ("__tok14", __tok14)

(*
atslangweb_home.atxt: 1365(line=67, offs=2) -- 1418(line=67, offs=55)
*)
val __tok13 = litxt(__tok14)
val () = theAtextMap_insert_str ("__tok13", __tok13)

(*
atslangweb_home.atxt: 1242(line=64, offs=2) -- 1421(line=68, offs=3)
*)
val __tok8 = menu("\
#__tok9$
#__tok11$
#__tok13$
")
val () = theAtextMap_insert_str ("__tok8", __tok8)

(*
atslangweb_home.atxt: 1422(line=68, offs=4) -- 1437(line=68, offs=19)
*)
val __tok15 = comment("menu")
val () = theAtextMap_insert_str ("__tok15", __tok15)

(*
atslangweb_home.atxt: 1440(line=70, offs=2) -- 1445(line=70, offs=7)
*)
val __tok16 = HR(2)
val () = theAtextMap_insert_str ("__tok16", __tok16)

(*
atslangweb_home.atxt: 1452(line=72, offs=6) -- 1486(line=72, offs=40)
*)
val __tok17 = uid("what_is_ats", "What is ATS?")
val () = theAtextMap_insert_str ("__tok17", __tok17)

(*
atslangweb_home.atxt: 1937(line=82, offs=7) -- 2021(line=82, offs=91)
*)
val __tok19 = ulink("http://shootout.alioth.debian.org/", "The Computer Language Benchmarks Game")
val () = theAtextMap_insert_str ("__tok19", __tok19)

(*
atslangweb_home.atxt: 1494(line=74, offs=2) -- 2110(line=85, offs=3)
*)
val __tok18 = para("\

ATS is a statically typed programming language that unifies implementation
with formal specification. It is equipped with a highly expressive type
system rooted in the framework <em>Applied Type System</em>, which gives
the language its name.  In particular, both dependent types and linear
types are available in ATS.  The current implementation of ATS
(ATS/Anairiats) is written in ATS itself. It can be as efficient as C/C++
(see #__tok19$
for concrete evidence) and supports a variety of programming paradigms that include:

")
val () = theAtextMap_insert_str ("__tok18", __tok18)

(*
atslangweb_home.atxt: 2111(line=85, offs=4) -- 2126(line=85, offs=19)
*)
val __tok20 = comment("para")
val () = theAtextMap_insert_str ("__tok20", __tok20)

(*
atslangweb_home.atxt: 2146(line=89, offs=2) -- 2586(line=97, offs=3)
*)
val __tok23 = para("\
<strong>Functional programming</strong>.
The core of ATS is a functional language based on eager
(aka. call-by-value) evaluation, which can also accommodate lazy
(aka. call-by-need) evaluation. The availability of linear types in ATS
often makes functional programs written in it run not only with
surprisingly high efficiency (when compared to C) but also with
surprisingly small (memory) footprint (when compared to C as well).
")
val () = theAtextMap_insert_str ("__tok23", __tok23)

(*
atslangweb_home.atxt: 2138(line=88, offs=2) -- 2587(line=97, offs=4)
*)
val __tok22 = litxt(__tok23)
val () = theAtextMap_insert_str ("__tok22", __tok22)

(*
atslangweb_home.atxt: 2598(line=100, offs=2) -- 3062(line=108, offs=3)
*)
val __tok25 = para("\
<strong>Imperative programming</strong>.
The novel and unique approach to imperative programming in ATS is firmly
rooted in the paradigm of <em>programming with theorem-proving</em>. The
type system of ATS allows many features considered dangerous in other
languages (e.g., explicit pointer arithmetic and explicit memory
allocation/deallocation) to be safely supported in ATS, making ATS a viable
programming langauge for low-level systems programming.
")
val () = theAtextMap_insert_str ("__tok25", __tok25)

(*
atslangweb_home.atxt: 2590(line=99, offs=2) -- 3063(line=108, offs=4)
*)
val __tok24 = litxt(__tok25)
val () = theAtextMap_insert_str ("__tok24", __tok24)

(*
atslangweb_home.atxt: 3074(line=111, offs=2) -- 3458(line=118, offs=3)
*)
val __tok27 = para("
<strong>Concurrent programming</strong>.
ATS, equipped with a multicore-safe implementation of garbage collection,
can support multithreaded programming through the use of pthreads. The
availability of linear types for tracking and safely manipulating resources
provides a effective means to constructing reliable programs that can take
advantage of multicore architectures.
")
val () = theAtextMap_insert_str ("__tok27", __tok27)

(*
atslangweb_home.atxt: 3066(line=110, offs=2) -- 3459(line=118, offs=4)
*)
val __tok26 = litxt(__tok27)
val () = theAtextMap_insert_str ("__tok26", __tok26)

(*
atslangweb_home.atxt: 3469(line=120, offs=9) -- 3676(line=124, offs=3)
*)
val __tok29 = para("
<strong>Modular programming</strong>. The module system of ATS is largely
infuenced by that of Modula-3, which is both simple and general as well as
effective in supporting large scale programming.
")
val () = theAtextMap_insert_str ("__tok29", __tok29)

(*
atslangweb_home.atxt: 3462(line=120, offs=2) -- 3677(line=124, offs=4)
*)
val __tok28 = litxt(__tok29)
val () = theAtextMap_insert_str ("__tok28", __tok28)

(*
atslangweb_home.atxt: 2129(line=87, offs=2) -- 3680(line=125, offs=3)
*)
val __tok21 = menu("\
#__tok22$

#__tok24$

#__tok26$

#__tok28$
")
val () = theAtextMap_insert_str ("__tok21", __tok21)

(*
atslangweb_home.atxt: 3681(line=125, offs=4) -- 3696(line=125, offs=19)
*)
val __tok30 = comment("menu")
val () = theAtextMap_insert_str ("__tok30", __tok30)

(*
atslangweb_home.atxt: 3699(line=127, offs=2) -- 4166(line=137, offs=3)
*)
val __tok31 = para("\

In addition, ATS contains a subsystem ATS/LF that supports a form of
(interactive) theorem-proving, where proofs are constructed as total
functions.  With this component, ATS advocates a
<em>programmer-centric</em> approach to program verification that combines
programming with theorem-proving in a syntactically intertwined
manner. Furthermore, this component can serve as a logical framework for
encoding deduction systems and their (meta-)properties.

")
val () = theAtextMap_insert_str ("__tok31", __tok31)

(*
atslangweb_home.atxt: 4167(line=137, offs=4) -- 4182(line=137, offs=19)
*)
val __tok32 = comment("para")
val () = theAtextMap_insert_str ("__tok32", __tok32)

(*
atslangweb_home.atxt: 4185(line=139, offs=2) -- 4190(line=139, offs=7)
*)
val __tok33 = HR(1)
val () = theAtextMap_insert_str ("__tok33", __tok33)

(*
atslangweb_home.atxt: 4197(line=141, offs=6) -- 4249(line=141, offs=58)
*)
val __tok34 = uid("what_is_ats_good_for", "What is ATS good for?")
val () = theAtextMap_insert_str ("__tok34", __tok34)

(*
atslangweb_home.atxt: 4274(line=145, offs=2) -- 4341(line=147, offs=3)
*)
val __tok37 = para("
ATS can enforce great precision in practical programming.
")
val () = theAtextMap_insert_str ("__tok37", __tok37)

(*
atslangweb_home.atxt: 4266(line=144, offs=2) -- 4342(line=147, offs=4)
*)
val __tok36 = litxt(__tok37)
val () = theAtextMap_insert_str ("__tok36", __tok36)

(*
atslangweb_home.atxt: 4353(line=150, offs=2) -- 4488(line=153, offs=3)
*)
val __tok39 = para("
ATS allows the programmer to write efficient functional programs that
directly manipulate native unboxed data representation.
")
val () = theAtextMap_insert_str ("__tok39", __tok39)

(*
atslangweb_home.atxt: 4345(line=149, offs=2) -- 4489(line=153, offs=4)
*)
val __tok38 = litxt(__tok39)
val () = theAtextMap_insert_str ("__tok38", __tok38)

(*
atslangweb_home.atxt: 4500(line=156, offs=2) -- 4610(line=159, offs=3)
*)
val __tok41 = para("
ATS allows the programmer to reduce the memory footprint of a program
by making use of linear types.
")
val () = theAtextMap_insert_str ("__tok41", __tok41)

(*
atslangweb_home.atxt: 4492(line=155, offs=2) -- 4611(line=159, offs=4)
*)
val __tok40 = litxt(__tok41)
val () = theAtextMap_insert_str ("__tok40", __tok40)

(*
atslangweb_home.atxt: 4622(line=162, offs=2) -- 4743(line=165, offs=3)
*)
val __tok43 = para("
ATS allows the programmer to enhance the safety (and efficiency) of a
program by making use of theorem-proving.
")
val () = theAtextMap_insert_str ("__tok43", __tok43)

(*
atslangweb_home.atxt: 4614(line=161, offs=2) -- 4744(line=165, offs=4)
*)
val __tok42 = litxt(__tok43)
val () = theAtextMap_insert_str ("__tok42", __tok42)

(*
atslangweb_home.atxt: 4755(line=168, offs=2) -- 4844(line=171, offs=3)
*)
val __tok45 = para("
ATS allows the programmer to write safe low-level code that runs in OS
kernels.
")
val () = theAtextMap_insert_str ("__tok45", __tok45)

(*
atslangweb_home.atxt: 4747(line=167, offs=2) -- 4845(line=171, offs=4)
*)
val __tok44 = litxt(__tok45)
val () = theAtextMap_insert_str ("__tok44", __tok44)

(*
atslangweb_home.atxt: 4856(line=174, offs=2) -- 4994(line=177, offs=3)
*)
val __tok47 = para("
ATS can help teach type theory, demonstrating concretely
the power and potential of types in constructing high-quality software.
")
val () = theAtextMap_insert_str ("__tok47", __tok47)

(*
atslangweb_home.atxt: 4848(line=173, offs=2) -- 4995(line=177, offs=4)
*)
val __tok46 = litxt(__tok47)
val () = theAtextMap_insert_str ("__tok46", __tok46)

(*
atslangweb_home.atxt: 4257(line=143, offs=2) -- 4998(line=178, offs=3)
*)
val __tok35 = menu("\
#__tok36$

#__tok38$

#__tok40$

#__tok42$

#__tok44$

#__tok46$
")
val () = theAtextMap_insert_str ("__tok35", __tok35)

(*
atslangweb_home.atxt: 4999(line=178, offs=4) -- 5014(line=178, offs=19)
*)
val __tok48 = comment("menu")
val () = theAtextMap_insert_str ("__tok48", __tok48)

(*
atslangweb_home.atxt: 5017(line=180, offs=2) -- 5022(line=180, offs=7)
*)
val __tok49 = HR(1)
val () = theAtextMap_insert_str ("__tok49", __tok49)

(*
atslangweb_home.atxt: 5029(line=182, offs=6) -- 5070(line=182, offs=47)
*)
val __tok50 = uid("acknowledgments", "Acknowledgments")
val () = theAtextMap_insert_str ("__tok50", __tok50)

(*
atslangweb_home.atxt: 5078(line=184, offs=2) -- 5505(line=194, offs=3)
*)
val __tok51 = para("\

The development of ATS has been funded in part by <a
href=\"http://www.nsf.gov\">National Science Foundation</a> (NSF) under the
grants no. CCR-0081316/CCR-0224244, no. CCR-0092703/0229480,
no. CNS-0202067, no. CCF-0702665 and no CCF-1018601. As always, <em>any
opinions, findings, and conclusions or recommendations expressed here are
those of the author(s) and do not necessarily reflect the views of the
NSF.</em>

")
val () = theAtextMap_insert_str ("__tok51", __tok51)

(*
atslangweb_home.atxt: 5506(line=194, offs=4) -- 5521(line=194, offs=19)
*)
val __tok52 = comment("para")
val () = theAtextMap_insert_str ("__tok52", __tok52)

(*
atslangweb_home.atxt: 5554(line=198, offs=8) -- 5588(line=198, offs=42)
*)
val __tok53 = comment("div/id=thePageBody-prop")
val () = theAtextMap_insert_str ("__tok53", __tok53)

(*
atslangweb_home.atxt: 1147(line=58, offs=2) -- 5591(line=199, offs=3)
*)
val thePageBody = strsub("
<div id=\"thePageBody-prop\">

<!-- ****** ****** -->

<h1>About ATS</h1>
#__tok8$#__tok15$

#__tok16$

<h2>#__tok17$</h2>

#__tok18$#__tok20$

#__tok21$#__tok30$

#__tok31$#__tok32$

#__tok33$

<h2>#__tok34$</h2>

#__tok35$#__tok48$

#__tok49$

<h2>#__tok50$</h2>

#__tok51$#__tok52$

<!-- ****** ****** -->

</div>#__tok53$
")
val () = theAtextMap_insert_str ("thePageBody", thePageBody)

(*
atslangweb_home.atxt: 5592(line=199, offs=4) -- 5609(line=199, offs=21)
*)
val __tok54 = comment("strsub")
val () = theAtextMap_insert_str ("__tok54", __tok54)

(*
atslangweb_home.atxt: 5714(line=206, offs=2) -- 5734(line=206, offs=22)
*)
val __tok57 = mysitelinks3("HOME")
val () = theAtextMap_insert_str ("__tok57", __tok57)

(*
atslangweb_home.atxt: 5648(line=204, offs=2) -- 5744(line=208, offs=3)
*)
val thePageFooterSeparator = strsub("\
<div class=\"Page-mysitelinks\">
#__tok57$
</div>
")
val () = theAtextMap_insert_str ("thePageFooterSeparator", thePageFooterSeparator)

(*
atslangweb_home.atxt: 5636(line=203, offs=2) -- 5745(line=208, offs=4)
*)
val __tok55 = ignoretxt(thePageFooterSeparator)
val () = theAtextMap_insert_str ("__tok55", __tok55)

(*
atslangweb_home.atxt: 5747(line=210, offs=1) -- 5903(line=219, offs=3)
*)

implement
main () = {
//
val () =  $STDIO.fclose_exn (theCSSfilr)
//
val () = fprint_filsub (stdout_ref, "atslangweb_temp.html")
//
} // end of [main]

