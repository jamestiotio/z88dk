;
;	CPC Maths Routines
;
;	August 2003 **_|warp6|_** <kbaccam /at/ free.fr>
;
;	$Id: log.asm,v 1.4 2016-06-22 19:50:49 dom Exp $
;

        SECTION smc_fp
        INCLUDE "cpcmath.inc"

        PUBLIC  log
        PUBLIC  logc

        EXTERN  get_para

log:
        call    get_para
logc:
        FPCALL  (CPCFP_FLO_LOG)
        ret
