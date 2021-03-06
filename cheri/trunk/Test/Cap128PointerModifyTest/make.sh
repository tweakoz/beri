#!/bin/bash
#
# Copyright (c) 2015 Matthew Naylor
# All rights reserved.
#
# This software was developed by SRI International and the University of
# Cambridge Computer Laboratory under DARPA/AFRL contract FA8750-10-C-0237
# ("CTSRD"), as part of the DARPA CRASH research programme.
#
# This software was developed by SRI International and the University of
# Cambridge Computer Laboratory under DARPA/AFRL contract FA8750-11-C-0249
# ("MRC2"), as part of the DARPA MRC research programme.
#
# This software was developed by the University of Cambridge Computer
# Laboratory as part of the Rigorous Engineering of Mainstream
# Systems (REMS) project, funded by EPSRC grant EP/K008528/1.
#
# @BERI_LICENSE_HEADER_START@
#
# Licensed to BERI Open Systems C.I.C. (BERI) under one or more contributor
# license agreements.  See the NOTICE file distributed with this work for
# additional information regarding copyright ownership.  BERI licenses this
# file to you under the BERI Hardware-Software License, Version 1.0 (the
# "License"); you may not use this file except in compliance with the
# License.  You may obtain a copy of the License at:
#
#   http://www.beri-open-systems.org/legal/license-1-0.txt
#
# Unless required by applicable law or agreed to in writing, Work distributed
# under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
# CONDITIONS OF ANY KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations under the License.
#
# @BERI_LICENSE_HEADER_END@
#

LIBS="../../:../../../../cherilibs/trunk/"
LIBS="$LIBS:../../../../cherilibs/trunk/BlueCheck:+"
BSC="bsc"
BSCFLAGS="-keep-fires -cross-info -aggressive-conditions \
  -wait-for-license -suppress-warnings G0043 \
  -p $LIBS \
  -D MEM128 -D CAP128 -D UNALIGNEDMEMORY -D BLUESIM"

TOPFILE=Cap128PointerModifyTest.bsv
TOPMOD=boundsCheckVerify

echo Compiling $TOPMOD in file $TOPFILE
if [ "$SYNTH" = "1" ]
then
  $BSC $BSCFLAGS -u -verilog -g $TOPMOD $TOPFILE
else
  if $BSC $BSCFLAGS -sim -g $TOPMOD -u $TOPFILE
  then
    if $BSC $BSCFLAGS -sim -o $TOPMOD -e $TOPMOD  $TOPMOD.ba
    then
      ./$TOPMOD
    else
      echo Failed to generate executable simulation model
    fi
  else
    echo Failed to compile
  fi
fi
