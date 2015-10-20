﻿/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

package hash
{
    import flash.utils.ByteArray;
    import flash.utils.Endian;
    
    /**
     * A class to compute the CRC-16/DNP checksum of a data stream.
     *
     * @playerversion Flash 10
     * @playerversion AIR 1.5.3
     * @playerversion AVM 0.4
     * @langversion 3.0
     */
    public final class crc16_dnp
    {
        
        private static var lookup:Vector.<uint> = make_crc_table();
        
        private static function make_crc_table():Vector.<uint>
        {
            var table:Vector.<uint> = new Vector.<uint>();
            
            var c:uint;
            var i:uint;
            var j:uint;
            
            for( i=0; i < 256; i++ )
            {
                c = i;
                for( j=0; j < 8; j++ )
                {
                    if( (c & 0x0001) != 0 )
                    {
                        c = 0xffff & ((c >>> 1) ^ _poly);
                    }
                    else
                    {
                        c = (c >>> 1);
                    }
                }
                table[i] = c;
            }
            
            return table;
        }
        
        // ---- CONFIG ----
        
        private static var _poly:uint = 0xa6bc;
        private static var _init:uint = 0x0000;
        
        // ---- CONFIG ----
        
        private var _crc:uint;
        private var _length:uint;
        private var _endian:String;
        
        /**
         * Creates a CRC-16/DNP object. 
         */
        public function crc16_dnp()
        {
            _length = 0xffff;
            _endian = Endian.LITTLE_ENDIAN;
            reset();
        }
        
        /**
         * Returns the byte order for the CRC.
         * 
         * <p>
         * Either <code>Endian.BIG_ENDIAN</code> for "Most significant bit first"
         * or <code>Endian.LITTLE_ENDIAN</code> for "Least significant bit first".
         * </p>
         * 
         * @see http://en.wikipedia.org/wiki/Computation_of_cyclic_redundancy_checks#Bit_ordering_.28endianness.29 Computation of CRC - Bit ordering (endianness)
         */
        public function get endian():String { return _endian; }
        
        /**
         * Returns the length the CRC.
         */
        public function get length():uint { return _length; }
        
        /**
         * Updates the CRC with a specified array of bytes.
         * 
         * @param bytes  The ByteArray object.
         * @param offset A zero-based index indicating the position into the array to begin reading.
         * @param length An unsigned integer indicating how far into the buffer to read
         *               (if <code>0</code>, the length of the ByteArray is used).
         */
        public function update( bytes:ByteArray, offset:uint = 0, length:uint = 0 ):void
        {
            if( length == 0 ) { length = bytes.length; }
        
            bytes.position = offset;
            
            var i:uint;
            var c:uint;
            var crc:uint = _length & (_crc);
            
            for( i = offset; i < length; i++ )
            {
                c    = uint( bytes[ i ] );
                crc  = (crc >>> 8) ^ lookup[(crc ^ c) & 0xff];
            }
            
             crc = 0xffff & ( ~crc );
            _crc = 0xffff & ( ( crc >>> 8 ) | ( (crc & 0xff) << 8 ) ); //reverse endian
        }
        
        /**
         * Resets the CRC to its initial value.
         */
        public function reset():void
        {
            _crc = _init;
        }
        
        /**
         * Returns the primitive value type of the CRC object (unsigned integer).
         * 
         * @return a 16bits digest
         */
        public function valueOf():uint
        {
            return _crc;
        }
        
        /**
         * Returns the string representation of the CRC value.
         * 
         * @param radix Specifies the numeric base (from 2 to 36) to use for
         *              the uint-to-string conversion. If you do not specify
         *              the radix parameter, the default value is <code>16</code>.
         * 
         * @return The numeric representation of the CRC object as a string.
         */
        public function toString( radix:Number = 16 ):String
        {
            return _crc.toString( radix );
        }
    
    }
}
