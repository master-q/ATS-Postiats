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
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
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
// Start Time: October, 2012
//
(* ****** ****** *)

staload UN = "prelude/SATS/unsafe.sats"
staload _(*anon*) = "prelude/DATS/unsafe.dats"

(* ****** ****** *)

staload "./pats_histaexp.sats"
staload "./pats_hidynexp.sats"

(* ****** ****** *)

staload "./pats_ccomp.sats"

(* ****** ****** *)

implement
hifundec_get_funlabopt (hfd) =
  $UN.ptrget<Option(funlab)> (hifundec_getref_funlabopt (hfd))
// end of [hifundec_get_funlabopt]

implement
hifundec_set_funlabopt (hfd, opt) =
  $UN.ptrset<Option(funlab)> (hifundec_getref_funlabopt (hfd), opt)
// end of [hifundec_set_funlabopt]

(* ****** ****** *)

implement
hiimpdec_get_funlabopt (imp) =
  $UN.ptrget<Option(funlab)> (hiimpdec_getref_funlabopt (imp))
// end of [hiimpdec_get_funlabopt]

implement
hiimpdec_set_funlabopt (imp, opt) =
  $UN.ptrset<Option(funlab)> (hiimpdec_getref_funlabopt (imp), opt)
// end of [hiimpdec_set_funlabopt]

(* ****** ****** *)

extern
fun primdec_make_node
  (loc: location, node: primdec_node): primdec
implement
primdec_make_node
  (loc, node) = '{
  primdec_loc= loc, primdec_node= node
} // end of [primdec_make_node]

(* ****** ****** *)

implement
primdec_none (loc) =
  primdec_make_node (loc, PMDnone ())
// end of [primdec_none]

(* ****** ****** *)

implement
primdec_list (loc, pmds) =
  primdec_make_node (loc, PMDlist (pmds))
// end of [primdec_list]

(* ****** ****** *)

implement
primdec_saspdec (loc, d2c) =
  primdec_make_node (loc, PMDsaspdec (d2c))
// end of [primdec_saspdec]

(* ****** ****** *)

implement
primdec_datdecs (loc, s2cs) =
  primdec_make_node (loc, PMDdatdecs (s2cs))
implement
primdec_exndecs (loc, d2cs) =
  primdec_make_node (loc, PMDexndecs (d2cs))

(* ****** ****** *)

implement
primdec_fundecs
  (loc, knd, decarg, hfds) =
  primdec_make_node (loc, PMDfundecs (knd, decarg, hfds))
// end of [primdec_fundecs]

(* ****** ****** *)

implement
primdec_valdecs (loc, knd, hvds, inss) =
  primdec_make_node (loc, PMDvaldecs (knd, hvds, inss))
implement
primdec_valdecs_rec (loc, knd, hvds, inss) =
  primdec_make_node (loc, PMDvaldecs_rec (knd, hvds, inss))

(* ****** ****** *)

implement
primdec_vardecs (loc, hvds, inss) =
  primdec_make_node (loc, PMDvardecs (hvds, inss))

(* ****** ****** *)

implement
primdec_staload (loc, fenv) =
  primdec_make_node (loc, PMDstaload (fenv))

(* ****** ****** *)

implement
primdec_impdec
  (loc, impdec) =
  primdec_make_node (loc, PMDimpdec (impdec))
// end of [primdec_impdec]

(* ****** ****** *)

implement
primdec_local
  (loc, _head, _body) =
  primdec_make_node (loc, PMDlocal (_head, _body))
// end of [primdec_local]

(* ****** ****** *)

extern
fun primval_make_node
  (loc: location, hse: hisexp, node: primval_node): primval
implement
primval_make_node
  (loc, hse, node) = '{
  primval_loc= loc, primval_type= hse, primval_node= node
} // end of [primval_make_node]

(* ****** ****** *)

implement
primval_tmp (loc, hse, tmp) =
  primval_make_node (loc, hse, PMVtmp (tmp))
// end of [primval_tmp]

implement
primval_tmpref (loc, hse, tmp) =
  primval_make_node (loc, hse, PMVtmpref (tmp))
// end of [primval_tmpref]

(* ****** ****** *)

implement
primval_arg (loc, hse, narg) =
  primval_make_node (loc, hse, PMVarg (narg))
implement
primval_argref (loc, hse, narg) =
  primval_make_node (loc, hse, PMVargref (narg))
implement
primval_argtmpref (loc, hse, narg) =
  primval_make_node (loc, hse, PMVargtmpref (narg))

(* ****** ****** *)

implement
primval_cst
  (loc, hse, d2c) =
  primval_make_node (loc, hse, PMVcst (d2c))
// end of [primval_cst]

implement
primval_var
  (loc, hse, d2v) =
  primval_make_node (loc, hse, PMVvar (d2v))
// end of [primval_var]

(* ****** ****** *)

implement
primval_int
  (loc, hse, i) =
  primval_make_node (loc, hse, PMVint (i))
// end of [primval_int]

implement
primval_intrep
  (loc, hse, rep) =
  primval_make_node (loc, hse, PMVintrep (rep))
// end of [primval_intrep]

(* ****** ****** *)

implement
primval_bool
  (loc, hse, b) =
  primval_make_node (loc, hse, PMVbool (b))
// end of [primval_bool]

implement
primval_char
  (loc, hse, c) =
  primval_make_node (loc, hse, PMVchar (c))
// end of [primval_char]

implement
primval_float
  (loc, hse, rep) =
  primval_make_node (loc, hse, PMVfloat (rep))
// end of [primval_float]

implement
primval_string
  (loc, hse, str) =
  primval_make_node (loc, hse, PMVstring (str))
// end of [primval_string]

(* ****** ****** *)

implement
primval_i0nt
  (loc, hse, x) =
  primval_make_node (loc, hse, PMVi0nt (x))
// end of [primval_i0nt]

implement
primval_f0loat
  (loc, hse, x) =
  primval_make_node (loc, hse, PMVf0loat (x))
// end of [primval_f0loat]

(* ****** ****** *)

implement
primval_sizeof
  (loc, hse, hselt) =
  primval_make_node (loc, hse, PMVsizeof (hselt))
// end of [primval_sizeof]

(* ****** ****** *)

implement
primval_cstsp
  (loc, hse, cstsp) =
  primval_make_node (loc, hse, PMVcstsp (cstsp))
// end of [primval_cstsp]

(* ****** ****** *)

implement
primval_top (loc, hse) =
  primval_make_node (loc, hse, PMVtop ())
// end of [primval_top]

implement
primval_empty (loc, hse) =
  primval_make_node (loc, hse, PMVempty ())
// end of [primval_empty]

(* ****** ****** *)

implement
primval_extval (loc, hse, name) =
  primval_make_node (loc, hse, PMVextval (name))
// end of [primval_extval]

(* ****** ****** *)

implement
primval_castfn
  (loc, hse, d2c, arg) =
  primval_make_node (loc, hse, PMVcastfn (d2c, arg))
// end of [primval_castfn]

(* ****** ****** *)

implement
primval_selcon
  (loc, hse, pmv, hse_sum, lab) =
  primval_make_node (loc, hse, PMVselcon (pmv, hse_sum, lab))
// end of [primval_selcon]

(* ****** ****** *)

implement
primval_select
  (loc, hse, pmv, hse_rt, pml) =
  primval_make_node (loc, hse, PMVselect (pmv, hse_rt, pml))
// end of [primval_select]

implement
primval_select2
  (loc, hse, pmv, hse_rt, pmls) =
  primval_make_node (loc, hse, PMVselect2 (pmv, hse_rt, pmls))
// end of [primval_select2]

(* ****** ****** *)

implement
primval_sel_var
  (loc, hse, pmv, hse_rt, pmls) =
  primval_make_node (loc, hse, PMVsel_var (pmv, hse_rt, pmls))
// end of [primval_sel_var]

implement
primval_sel_ptr
  (loc, hse, pmv, hse_rt, pmls) =
  primval_make_node (loc, hse, PMVsel_ptr (pmv, hse_rt, pmls))
// end of [primval_sel_ptr]

(* ****** ****** *)

implement
primval_ptrof
  (loc, hse, pmv) =
  primval_make_node (loc, hse, PMVptrof (pmv))
// end of [primval_ptrof]

implement
primval_ptrofsel (
  loc, hse, pmv, hse_rt, pmls
) =
  primval_make_node (loc, hse, PMVptrofsel (pmv, hse_rt, pmls))
// end of [primval_ptrofsel]

(* ****** ****** *)

implement
primval_refarg
  (loc, hse, knd, pmv) =
  primval_make_node (loc, hse, PMVrefarg (knd, pmv))
// end of [primval_refarg]

(* ****** ****** *)

implement
primval_funlab
  (loc, hse, fl) =
  primval_make_node (loc, hse, PMVfunlab (fl))
// end of [primval_funlab]

implement
primval_funlab2
  (loc, hse, d2v, fl) =
  primval_make_node (loc, hse, PMVfunlab2 (d2v, fl))
// end of [primval_funlab2]

(* ****** ****** *)

implement
primval_tmpltcst
  (loc, hse, d2c, t2mas) =
  primval_make_node (loc, hse, PMVtmpltcst (d2c, t2mas))
// end of [primval_tmpltcst]

implement
primval_tmpltcstmat
  (loc, hse, d2c, t2mas, mat) =
  primval_make_node (loc, hse, PMVtmpltcstmat (d2c, t2mas, mat))
// end of [primval_tmpltcstmat]

implement
primval_tmpltvar
  (loc, hse, d2v, t2mas) =
  primval_make_node (loc, hse, PMVtmpltvar (d2v, t2mas))
// end of [primval_tmpltvar]

(* ****** ****** *)

implement
primval_err
  (loc, hse) = primval_make_node (loc, hse, PMVerr ())
// end of [primval_err]

(* ****** ****** *)

implement
primval_make_sizeof
  (loc, s2elt) = let
  val hse = hisexp_size_type ()
in
  primval_sizeof (loc, hse, s2elt)
end // end of [primval_make_sizeof]

(* ****** ****** *)

implement
primval_make_tmp
  (loc, tmp) = let
  val hse = tmpvar_get_type (tmp) in primval_tmp (loc, hse, tmp)
end // end of [primval_make_tmp]
  
(* ****** ****** *)

implement
primval_make_ptrof
  (loc, pmv) = let
  val hse = hisexp_typtr 
in
//
case+
  pmv.primval_node of
| PMVargref (narg) =>
    primval_arg (loc, hse, narg)
  // end of [PMVargref]
| _ => primval_ptrof (loc, hse, pmv)
end // end of [primval_make_ptrof]

(* ****** ****** *)

implement
primval_make_ptrofsel
  (loc, pmv, hse_rt, pmls) = let
  val hse = hisexp_typtr 
  val pmv_sel = primval_select2 (loc, hse, pmv, hse_rt, pmls)
in
  primval_make_ptrof (loc, pmv_sel)
end // end of [primval_make_ptrofsel]

(* ****** ****** *)

implement
primval_make_refarg
  (loc, knd, pmv) = let
in
//
if knd = 0 then let
  val hse = pmv.primval_type
in
  primval_refarg (loc, hse, knd, pmv)
end else let
  val hse = hisexp_typtr
  val pmv = primval_make_ptrof (loc, pmv)
in
  primval_refarg (loc, hse, knd, pmv)
end // end of [if]
//
end // end of [primval_make_refarg]

(* ****** ****** *)

implement
ibranch_make
  (tlab, inss) = '{
  ibranch_lab= tlab, ibranch_inslst= inss
} // end of [ibranch_make]

(* ****** ****** *)

implement
primlab_is_lab (pml) =
  case+ pml.primlab_node of
  | PMLlab _ => true | PMLind _ => false
// end of [primlab_is_lab]

implement
primlab_is_ind (pml) =
  case+ pml.primlab_node of
  | PMLlab _ => false | PMLind _ => true
// end of [primlab_is_ind]

(* ****** ****** *)

implement
primlab_lab (loc, lab) = '{
  primlab_loc= loc, primlab_node= PMLlab (lab)
} // end of [primlab_lab]

implement
primlab_ind (loc, ind) = '{
  primlab_loc= loc, primlab_node= PMLind (ind)
} // end of [primlab_ind]

(* ****** ****** *)

extern
fun instr_make_node
  (loc: location, node: instr_node): instr
implement
instr_make_node
  (loc, node) = '{
  instr_loc= loc, instr_node= node
} // end of [instr_make_node]

(* ****** ****** *)

implement
instr_funlab (loc, fl) =
  instr_make_node (loc, INSfunlab (fl))
// end of [instr_funlab]

(* ****** ****** *)

implement
instr_move_val (loc, tmp, pmv) =
  instr_make_node (loc, INSmove_val (tmp, pmv))
// end of [instr_move_val]

implement
instr_pmove_val (loc, tmp, pmv) =
  instr_make_node (loc, INSpmove_val (tmp, pmv))
// end of [instr_pmove_val]

(* ****** ****** *)

implement
instr_move_arg_val (loc, arg, pmv) =
  instr_make_node (loc, INSmove_arg_val (arg, pmv))
// end of [instr_move_arg_val]

(* ****** ****** *)

implement
instr_funcall (
  loc, tmpret, _fun, hse_fun, _arg
) = instr_make_node
  (loc, INSfuncall (tmpret, _fun, hse_fun, _arg))
// end of [instr_funcall]

(* ****** ****** *)

implement
instr_cond
  (loc, _cond, _then, _else) =
  instr_make_node (loc, INScond (_cond, _then, _else))
// end of [instr_cond]

implement
instr_switch
  (loc, xs) = instr_make_node (loc, INSswitch (xs))
// end of [instr_switch]

(* ****** ****** *)

implement
instr_letpop
  (loc) = instr_make_node (loc, INSletpop ())
// end of [instr_letpop]

implement
instr_letpush
  (loc, pmds) = instr_make_node (loc, INSletpush (pmds))
// end of [instr_letpush]

(* ****** ****** *)

implement
instr_move_con (
  loc, tmpret, d2c, hse_sum, _arg
) = instr_make_node
  (loc, INSmove_con (tmpret, d2c, hse_sum, _arg))
// end of [instr_move_con]

(* ****** ****** *)

implement
instr_move_ref
  (loc, tmpret, pmv) =
  instr_make_node (loc, INSmove_ref (tmpret, pmv))
// end of [instr_move_ref]

(* ****** ****** *)

implement
instr_move_boxrec
(
  loc, tmpret, lpmvs, hse_rec
) = instr_make_node
  (loc, INSmove_boxrec (tmpret, lpmvs, hse_rec))
// end of [instr_move_boxrec]

implement
instr_move_fltrec
(
  loc, tmpret, lpmvs, hse_rec
) = instr_make_node
  (loc, INSmove_fltrec (tmpret, lpmvs, hse_rec))
// end of [instr_move_fltrec]

implement
instr_move_fltrec2
(
  loc, tmpret, lpmvs, hse_rec
) = let
in
//
case+
  hse_rec.hisexp_node of
| HSEtyrecsin (lhse) => let
    val-list_cons (lpmv, _) = lpmvs
    val+LABPRIMVAL (lab, pmv) = lpmv
  in
    instr_move_val (loc, tmpret, pmv)
  end // end of [HSEtyrecsin]
| _ => instr_move_fltrec (loc, tmpret, lpmvs, hse_rec)
//
end // end of [instr_move_fltrec2]

(* ****** ****** *)

implement
instr_patck
  (loc, pmv, pck, pcknt) =
  instr_make_node (loc, INSpatck (pmv, pck, pcknt))
// end of [instr_patck]

(* ****** ****** *)

implement
instr_move_selcon (
  loc, tmp, hse, pmv, hse_sum, lab
) = let
  val pmv_sel = primval_selcon (loc, hse, pmv, hse_sum, lab)
in
  instr_move_val (loc, tmp, pmv_sel)
end // end of [instr_selcon]

implement
instr_move_select (
  loc, tmp, hse, pmv, hse_rt, pml
) = let
  val pmv_sel = primval_select (loc, hse, pmv, hse_rt, pml)
in
  instr_move_val (loc, tmp, pmv_sel)
end // end of [instr_select]

implement
instr_move_select2 (
  loc, tmp, hse, pmv, hse_rt, pmls
) = let
  val pmv_sel = primval_select2 (loc, hse, pmv, hse_rt, pmls)
in
  instr_move_val (loc, tmp, pmv_sel)
end // end of [instr_select2]

(* ****** ****** *)

implement
instr_move_ptrofsel
  (loc, tmp, pmv, hse_rt, hils) =
  instr_make_node (loc, INSmove_ptrofsel (tmp, pmv, hse_rt, hils))
// end of [instr_move_ptrofsel]

(* ****** ****** *)

(*
implement
instr_load_varofs
  (loc, tmp, pmv, hse_rt, pmls) =
  instr_make_node (loc, INSload_varofs (tmp, pmv, hse_rt, pmls))
// end of [instr_load_varofs]

implement
instr_load_ptrofs
  (loc, tmp, pmv, hse_rt, pmls) =
  instr_make_node (loc, INSload_ptrofs (tmp, pmv, hse_rt, pmls))
// end of [instr_load_ptrofs]
*)

(* ****** ****** *)

implement
instr_store_varofs
  (loc, pmv_l, hse_rt, ofs, pmv_r) =
  instr_make_node (loc, INSstore_varofs (pmv_l, hse_rt, ofs, pmv_r))
// end of [instr_store_varofs]

implement
instr_store_ptrofs
  (loc, pmv_l, hse_rt, ofs, pmv_r) =
  instr_make_node (loc, INSstore_ptrofs (pmv_l, hse_rt, ofs, pmv_r))
// end of [instr_store_ptrofs]

(* ****** ****** *)

implement
instr_xstore_varofs
  (loc, pmv_l, hse_rt, ofs, pmv_r) =
  instr_make_node (loc, INSxstore_varofs (pmv_l, hse_rt, ofs, pmv_r))
// end of [instr_xstore_varofs]

implement
instr_xstore_ptrofs
  (loc, pmv_l, hse_rt, ofs, pmv_r) =
  instr_make_node (loc, INSxstore_ptrofs (pmv_l, hse_rt, ofs, pmv_r))
// end of [instr_xstore_ptrofs]

(* ****** ****** *)

implement
instr_move_list_nil
  (loc, tmp) = instr_make_node (loc, INSmove_list_nil (tmp))
// end of [instr_move_list_nil]
implement
instr_pmove_list_nil
  (loc, tmp) = instr_make_node (loc, INSpmove_list_nil (tmp))
// end of [instr_pmove_list_nil]
implement
instr_pmove_list_cons
  (loc, tmp, hse_elt) =
  instr_make_node (loc, INSpmove_list_cons (tmp, hse_elt))
// end of [instr_pmove_list_cons]

(* ****** ****** *)

implement
instr_move_list_phead
  (loc, tmphd, tmptl, hse_elt) =
  instr_make_node (loc, INSmove_list_phead (tmphd, tmptl, hse_elt))
// end of [instr_move_list_phead]

implement
instr_move_list_ptail
  (loc, tl_new, tl_old, hse_elt) =
  instr_make_node (loc, INSmove_list_ptail (tl_new, tl_old, hse_elt))
// end of [instr_move_list_ptail]

(* ****** ****** *)

implement
instr_move_arrpsz_ptr
  (loc, tmp, psz) =
  instr_make_node (loc, INSmove_arrpsz_ptr (tmp, psz))
// end of [instr_move_arrpsz_ptr]

(* ****** ****** *)

implement
instr_store_arrpsz_asz
  (loc, tmp, asz) =
  instr_make_node (loc, INSstore_arrpsz_asz (tmp, asz))
// end of [instr_store_arrpsz_asz]

implement
instr_store_arrpsz_ptr
  (loc, tmp, hse_elt, asz) =
  instr_make_node (loc, INSstore_arrpsz_ptr (tmp, hse_elt, asz))
// end of [instr_store_arrpsz_ptr]

(* ****** ****** *)

implement
instr_update_ptrinc
  (loc, tmpelt, hse_elt) =
  instr_make_node (loc, INSupdate_ptrinc (tmpelt, hse_elt))
// end of [instr_update_ptrinc]

implement
instr_update_ptrdec
  (loc, tmpelt, hse_elt) =
  instr_make_node (loc, INSupdate_ptrdec (tmpelt, hse_elt))
// end of [instr_update_ptrdec]

(* ****** ****** *)

implement
instr_tmpdec
  (loc, tmp) = instr_make_node (loc, INStmpdec (tmp))
// end of [instr_tempdec]

(* ****** ****** *)

(* end of [pats_ccomp.dats] *)
