/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

package hash
{
    import flash.utils.ByteArray;
    import flash.utils.Endian;
    
    /**
     * A class to compute the CRC-8/MAXIM checksum of a data stream.
     * 
     * <p>
     * Other names: DOW-CRC
     * </p>
     *
     * @playerversion Flash 10
     * @playerversion AIR 1.5.3
     * @playerversion AVM 0.4
     * @langversion 3.0
     */
    public final class crc8_maxim
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
                    if( (c & 0x01) != 0 )
                    {
                        c = 0xff & ((c >>> 1) ^ _poly);
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
        
        private static var _poly:uint = 0x8c;
        private static var _init:uint = 0x00;
        
        // ---- CONFIG ----
        
        private var _crc:uint;
        private var _length:uint;
        private var _endian:String;
        
        /**
         * Creates a CRC-8/MAXIM object. 
         */
        public function crc8_maxim()
        {
            _length = 0xff;
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
                crc  = lookup[(crc ^ c) & 0xff];
            }
            
            _crc = crc;
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
         * @return a 8bits digest
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