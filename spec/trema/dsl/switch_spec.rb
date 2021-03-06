#
# Author: Yasuhito Takamiya <yasuhito@gmail.com>
#
# Copyright (C) 2008-2013 NEC Corporation
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License, version 2, as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
#


require File.join( File.dirname( __FILE__ ), "..", "..", "spec_helper" )
require "trema/dsl/switch"


module Trema
  module DSL
    describe Switch do
      before :each do
        @switch = Switch.new
      end


      context %[when parsing "switch { ... }"] do
        it %[recognizes "dpid DATAPATH_ID" directive] do
          expect do
            @switch.dpid "0xabc"
          end.not_to raise_error
        end


        it %[recognizes "datapath_id DATAPATH_ID" directive] do
          expect do
            @switch.datapath_id "0xabc"
          end.not_to raise_error
        end


        it %[recognizes "ports PORT_NUMBERS" directive] do
          expect do
            @switch.ports "0-4"
          end.not_to raise_error
        end
      end


      context "when getting the attributes of a switch" do
        it "returns its dpid in long format" do
          @switch.dpid "0xabc"
          expect(@switch[ :dpid_long ]).to eq("0000000000000abc")
        end


        it "returns its dpid in short format" do
          @switch.dpid "0xabc"
          expect(@switch[ :dpid_short ]).to eq("0xabc")
        end
      end
    end
  end
end


### Local variables:
### mode: Ruby
### coding: utf-8-unix
### indent-tabs-mode: nil
### End:
