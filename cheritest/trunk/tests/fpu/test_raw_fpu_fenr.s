#-
# Copyright (c) 2012 Ben Thorner
# Copyright (c) 2013 Colin Rothwell
# All rights reserved.
#
# This software was developed by Ben Thorner as part of his summer internship
# and Colin Rothwell as part of his final year undergraduate project.
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

.set mips64
.set noreorder
.set nobopt
.set noat

#
# Test FENR
#

		.text
		.global start
		.ent start
start:     
		# First enable CP1 
		dli $t1, 1 << 29
		or $at, $at, $t1   # Enable CP1    
		mtc0    $at, $12 
		    
		# Individual tests
		    
		li $t0, 0xf80
		ctc1 $t0, $f28 # FENR
		cfc1 $a0, $f28
		
		ctc1 $zero, $f28
		cfc1 $a1, $f28

		li $t0, 0xf80
		ctc1 $t0, $f31 # FCSR
		cfc1 $a2, $f28

		ctc1 $zero, $f31 # FCSR
		cfc1 $a3, $f28

		# Dump registers on the simulator (gxemul dumps regs on exit)
		mtc0 $at, $26
		nop
		nop

		# Terminate the simulator
		mtc0 $at, $23
end:
		b end
		nop
		.end start
