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

class test_raw_fpu_abs(BaseBERITestCase):
    def test_abs_single(self):
        '''Test we can take absolute value of a float'''
        self.assertRegisterEqual(self.MIPS.s1, 0x0FFF0000, "Failed to take absolute of single")

    @attr('float64')
    def test_abs_double(self):
        '''Test we can take absolute value of a double'''
        self.assertRegisterEqual(self.MIPS.s0, 0x07FF000000000000, "Failed to take absolute of double")

    @attr('floatlegacyabs')
    def test_abs_single_denorm(self):
        '''Test that ABS.S flushes denormalized results to zero'''
        self.assertRegisterEqual(self.MIPS.s4, 0x0, "ABS.S failed to flush denormalised result")
