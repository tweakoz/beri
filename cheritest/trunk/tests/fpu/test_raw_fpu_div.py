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

from beritest_tools import BaseBERITestCase
from nose.plugins.attrib import attr

class test_raw_fpu_div(BaseBERITestCase):
    def test_div_single(self):
        '''Test we can divide in single precision'''
        self.assertRegisterEqual(self.MIPS.s1, 0x40800000, "Failed to divide 20.0 by 5.0 in single precision")

    @attr('float64')
    def test_div_double(self):
        '''Test we can divide in double precision'''
        self.assertRegisterEqual(self.MIPS.s0, 0x407159d4d1bc2504, "Double precision division failed")

    @attr('float64')
    @attr('floatechonan')
    def test_div_double_qnan(self):
        '''Test double precision division of QNaN'''
        self.assertRegisterEqual(self.MIPS.s3, 0x7FF1000000000000, "DIV.S failed to echo QNaN");

    def test_div_single_denorm(self):
        '''Test that DIV.S flushes a denormalized result to zero'''
        self.assertRegisterEqual(self.MIPS.s4, 0x0, "DIV.S failed to flush denormalised result");
