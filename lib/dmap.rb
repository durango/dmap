=begin
 dmap.rb - Foundation of dmap
 *
 * Copyright (c) 2011, Daniel Durante <officedebo at gmail dot com>
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 *   * Redistributions of source code must retain the above copyright notice,
 *     this list of conditions and the following disclaimer.
 *   * Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 *   * Neither the name of Redis nor the names of its contributors may be used
 *     to endorse or promote products derived from this software without
 *     specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
=end

libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

# core
require 'dmap/core'
require 'support/ordered_hash'

# properties
require 'dmap/properties/core'
require 'dmap/properties/boolean'
require 'dmap/properties/date' # DateTime, Date and Time
require 'dmap/properties/decimal' # Float and Decimal
require 'dmap/properties/integer'
require 'dmap/properties/misc' # Object, Discriminator, Blob
require 'dmap/properties/serial'
require 'dmap/properties/string' # String and Text

# validations
require 'dmap/validations/core'
require 'dmap/validations/absence'
require 'dmap/validations/access' # accessor, writer, and reader
require 'dmap/validations/confirmation' # confirmation and acceptance
require 'dmap/validations/format'
require 'dmap/validations/length'
require 'dmap/validations/misc' # key, required, lazy
require 'dmap/validations/method'
require 'dmap/validations/presence'
require 'dmap/validations/primitive'
require 'dmap/validations/uniqueness'
require 'dmap/validations/within'

# associations
require 'dmap/associations/core'
require 'dmap/associations/belongs_to'
require 'dmap/associations/hasn'

# Template for building new model
require 'dmap/new'