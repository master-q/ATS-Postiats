(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2011-20?? Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of the GNU LESSER GENERAL PUBLIC LICENSE as published by the
** Free Software Foundation; either version 2.1, or (at your option)  any
** later version.
** 
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
** 
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*)

(* ****** ****** *)
//
// Author: Hongwei Xi (gmhwxi AT gmail DOT com)
// Start Time: June, 2012
//
(* ****** ****** *)

fun qsort
  {a:vt0p}{n:int} (
  A: &(@[a][n]), asz: size_t (n), tsz: sizeof (a), f: compref (a)
) :<!wrt> void = "atslib_qsort" // end of [qsort]

(* ****** ****** *)

fun bsearch
  {a:vt0p}{n:int} (
  key: &a, A: &(@[a][n]), asz: size_t (n), tsz: sizeof (a), cmp: compref (a)
) :<> ptr = "atslib_bsearch" // end of [bsearch]

(* ****** ****** *)

(* end of [stdlib.sats] *)
